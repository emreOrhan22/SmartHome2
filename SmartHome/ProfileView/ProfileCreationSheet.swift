//
//  ProfileCreationSheet.swift
//  SmartHome
//
//  Created by Emre on 22.04.2025.
//

import SwiftUI

struct ProfileCreationSheet: View {
    @Binding var isPresented: Bool
    @ObservedObject var viewModel: ProfileViewModel
    var onSave: () -> Void

    @State private var name: String = ""
    @State private var selectedIcon: String = "person"
    @State private var addPin: Bool = false
    @State private var pinCode: String = ""
    @FocusState private var focusedField: Field?

    enum Field {
        case name, pin
    }

    let availableIcons = ["father", "mother", "boy", "girl"]

    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()

            VStack(spacing: 20) {
                Text("Create New Profile")
                    .font(.headline)

                TextField("Profile Name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .focused($focusedField, equals: .name)

                HStack(spacing: 15) {
                    ForEach(availableIcons, id: \.self) { icon in
                        Image(icon)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                            .padding(12)
                            .background(selectedIcon == icon ? Color.blue.opacity(0.2) : Color.clear)
                            .clipShape(Circle())
                            .onTapGesture {
                                selectedIcon = icon
                            }
                    }
                }

                Toggle("Add PIN", isOn: $addPin)
                    .padding(.horizontal)

                if addPin {
                    VStack(spacing: 10) {
                        HStack(spacing: 15) {
                            ForEach(0..<4) { index in
                                ZStack {
                                    Circle()
                                        .stroke(Color.gray, lineWidth: 1)
                                        .frame(width: 24, height: 24)

                                    if index < pinCode.count {
                                        Circle()
                                            .fill(Color.black)
                                            .frame(width: 12, height: 12)
                                    }
                                }
                            }
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            focusedField = .pin
                        }

                        TextField("", text: $pinCode)
                            .keyboardType(.numberPad)
                            .focused($focusedField, equals: .pin)
                            .onChange(of: pinCode) { newValue in
                                pinCode = newValue.filter { $0.isNumber }
                                if pinCode.count > 4 {
                                    pinCode = String(pinCode.prefix(4))
                                }
                            }
                            .frame(width: 1, height: 1)
                            .opacity(0.01)
                    }
                }

                Button("Create") {
                    let newProfile = Profile(name: name, imageName: selectedIcon, pin: addPin ? pinCode : nil)
                    viewModel.addProfile(newProfile)
                    isPresented = false
                    onSave()
                }
                .disabled(name.isEmpty || (addPin && pinCode.count != 4))
                .padding()

                Spacer()
            }
            .padding()
            .navigationBarTitle("Add Profile", displayMode: .inline)
            .navigationBarItems(trailing: Button("Cancel") {
                isPresented = false
            })
        }
        .hideKeyboardOnTap()
    }
}

extension View {
    func hideKeyboardOnTap() -> some View {
        self.onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
}
