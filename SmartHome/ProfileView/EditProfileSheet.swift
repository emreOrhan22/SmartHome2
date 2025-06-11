//
//  EditProfileSheet.swift
//  SmartHome
//
//  Created by Emre on 25.04.2025.
//
import SwiftUI

struct EditProfileSheet: View {
    @Binding var isPresented: Bool
    @Binding var profile: Profile
    var onSave: (Profile) -> Void

    @State private var name: String
    @State private var pin: String
    @State private var hasPin: Bool
    @State private var selectedIcon: String

    let availableIcons = ["father", "mother", "boy", "girl"]

    init(
        isPresented: Binding<Bool>,
        profile: Binding<Profile>,
        onSave: @escaping (Profile) -> Void
    ) {
        self._isPresented = isPresented
        self._profile = profile
        self.onSave = onSave

        _name = State(initialValue: profile.wrappedValue.name)
        _pin = State(initialValue: profile.wrappedValue.pin ?? "")
        _hasPin = State(initialValue: profile.wrappedValue.pin != nil)
        _selectedIcon = State(initialValue: profile.wrappedValue.imageName)
    }

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                TextField("Profile Name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                Toggle("Require PIN", isOn: $hasPin)
                    .padding(.horizontal)

                if hasPin {
                    SecureField("4-digit PIN", text: $pin)
                        .keyboardType(.numberPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                }

                Text("Select Icon")
                    .font(.subheadline.bold())

                HStack(spacing: 15) {
                    ForEach(availableIcons, id: \.self) { icon in
                        Image(icon)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .padding(6)
                            .background(selectedIcon == icon ? Color.blue.opacity(0.2) : Color.clear)
                            .clipShape(Circle())
                            .onTapGesture {
                                selectedIcon = icon
                            }
                    }
                }

                Spacer()

                HStack {
                    Button("Cancel") {
                        isPresented = false
                    }
                    .foregroundColor(.red)

                    Spacer()

                    Button("Save") {
                        let updated = Profile(
                            id: profile.id,
                            name: name,
                            imageName: selectedIcon,
                            pin: hasPin ? pin : nil
                        )
                        onSave(updated)
                        isPresented = false
                    }
                    .disabled(name.isEmpty || (hasPin && pin.count != 4))
                }
                .padding(.horizontal)
            }
            .padding()
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    EditProfileSheet(
        isPresented: .constant(true),
        profile: .constant(
            Profile(
                id: UUID().uuidString,
                name: "Emre",
                imageName: "father",
                pin: "1234"
            )
        ),
        onSave: { updatedProfile in
            print("Updated Profile: \(updatedProfile)")
        }
    )
}

