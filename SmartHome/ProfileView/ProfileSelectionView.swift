//
//  ProfileSelectionView.swift
//  SmartHome
//
//  Created by Emre on 22.04.2025.
//

import SwiftUI

struct ProfileSelectionView: View {
    @ObservedObject var viewModel = ProfileViewModel()
    @AppStorage("selectedProfile") private var selectedProfileName: String?
    @AppStorage("isProfileSelected") private var isProfileSelected: Bool = false

    @State private var showCreationSheet = false
    @State private var animateProfiles: Bool = false
    @State private var tappedProfileID: UUID? = nil
    @State private var startTransition: Bool = false
    @State private var isEditing: Bool = false
    @State private var showDeleteAlert: Bool = false
    @State private var selectedForDeletion: Profile? = nil

    @State private var showEditSheet = false
    @State private var profileToEdit: Profile? = nil

    @State private var showPinPrompt: Bool = false
    @State private var enteredPin: String = ""
    @State private var wrongPinShake: Bool = false
    @State private var selectedPinProfile: Profile? = nil
    @FocusState private var pinFieldIsFocused: Bool

    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        VStack(spacing: 20) {
            Text("Profiles")
                .font(.title.bold())
                .padding(.top)
                .toolbarTitleDisplayMode(.inline)

            Text("Who will use this app?")
                .font(.title2.bold())
                .opacity(animateProfiles ? 1 : 0)
                .animation(.easeInOut.delay(0.1), value: animateProfiles)

            LazyVGrid(columns: columns, spacing: 30) {
                ForEach(viewModel.profiles.indices, id: \.self) { index in
                    let profile = viewModel.profiles[index]

                    ProfileCardView(
                        profile: profile,
                        isEditing: isEditing,
                        isSelected: tappedProfileID == profile.id,
                        onSelect: {
                            if let pin = profile.pin, !pin.isEmpty {
                                selectedPinProfile = profile
                                showPinPrompt = true
                            } else {
                                selectedProfileName = profile.name
                                isProfileSelected = true
                            }
                        },
                        onDelete: {
                            selectedForDeletion = profile
                            showDeleteAlert = true
                        },
                        onEditTapped: {
                            profileToEdit = profile
                            showEditSheet = true
                        }
                    )
                }

                // + New Profile Card
                VStack {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                        .frame(width: 70, height: 70)
                        .overlay(
                            Image(systemName: "plus")
                                .font(.title2)
                        )
                    Text("Add Profile")
                        .font(.caption)
                }
                .onTapGesture {
                    showCreationSheet = true
                }
            }

            Spacer()
        }
        .padding()
        .opacity(startTransition ? 0 : 1)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(isEditing ? "Done" : "Edit") {
                    withAnimation {
                        isEditing.toggle()
                    }
                }
            }
        }
        .onAppear {
            viewModel.loadProfiles()
            animateProfiles = true
        }
        .sheet(isPresented: $showCreationSheet) {
            ProfileCreationSheet(isPresented: $showCreationSheet, viewModel: viewModel) {
                viewModel.loadProfiles()
            }
            .transition(.move(edge: .bottom).combined(with: .opacity))
        }
        .sheet(isPresented: $showEditSheet) {
            if let profile = profileToEdit {
                EditProfileSheet(
                    isPresented: $showEditSheet,
                    profile: .constant(profile),
                    onSave: { updatedProfile in
                        viewModel.updateProfile(updatedProfile)
                        viewModel.loadProfiles()
                    }
                )
            }
        }
        .alert(isPresented: $showDeleteAlert) {
            Alert(
                title: Text("Delete Profile"),
                message: Text("Are you sure you want to delete this profile?"),
                primaryButton: .destructive(Text("Delete")) {
                    if let profileToDelete = selectedForDeletion {
                        viewModel.deleteProfile(profileToDelete)
                    }
                },
                secondaryButton: .cancel()
            )
        }
        .overlay(
            pinPromptOverlay()
        )
    }

    // PIN giriş ekranı
    @ViewBuilder
    private func pinPromptOverlay() -> some View {
        if showPinPrompt, let profile = selectedPinProfile {
            Color.black.opacity(0.4).ignoresSafeArea()

            VStack(spacing: 16) {
                Text("Enter PIN for \(profile.name)")
                    .font(.headline)

                HStack(spacing: 15) {
                    ForEach(0..<4) { index in
                        ZStack {
                            Circle()
                                .stroke(Color.gray, lineWidth: 1)
                                .frame(width: 24, height: 24)

                            if index < enteredPin.count {
                                Circle()
                                    .fill(Color.black)
                                    .frame(width: 12, height: 12)
                            }
                        }
                    }
                }
                .modifier(ShakeEffect(shakes: wrongPinShake ? 2 : 0))

                TextField("", text: $enteredPin)
                    .keyboardType(.numberPad)
                    .focused($pinFieldIsFocused)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            pinFieldIsFocused = true
                        }
                    }
                    .onChange(of: enteredPin) { newValue in
                        enteredPin = newValue.filter { $0.isNumber }
                        if enteredPin.count == 4 {
                            if enteredPin == profile.pin {
                                selectedProfileName = profile.name
                                isProfileSelected = true
                                showPinPrompt = false
                                enteredPin = ""
                            } else {
                                withAnimation {
                                    wrongPinShake = true
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    wrongPinShake = false
                                    enteredPin = ""
                                }
                            }
                        }
                    }
                    .frame(width: 1, height: 1)
                    .opacity(0.01)

                Button("Cancel") {
                    showPinPrompt = false
                    enteredPin = ""
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(20)
            .padding()
        }
    }
}

// Shake effect aynı kalıyor
struct ShakeEffect: GeometryEffect {
    var shakes: Int
    var amount: CGFloat = 6
    var animatableData: CGFloat

    init(shakes: Int) {
        self.shakes = shakes
        self.animatableData = CGFloat(shakes)
    }

    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(translationX:
            amount * sin(animatableData * .pi * 2), y: 0))
    }
}

#Preview {
    NavigationStack {
        ProfileSelectionView()
    }
}
