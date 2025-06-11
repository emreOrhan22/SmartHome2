//
//  SignUpView.swift
//  SmartHome
//
//  Created by Emre on 26.03.2025.
//

import SwiftUI

struct SignUpView: View {
    @StateObject private var viewModel = SignUpViewModel()

    var body: some View {
        VStack(spacing: 20) {
            Text("Sign Up")
                .font(.largeTitle)
                .bold()

            // Name
            TextField("Name", text: $viewModel.name)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(viewModel.nameError != nil ? Color.red : Color.clear, lineWidth: 1)
                )

            if let error = viewModel.nameError {
                Text(error)
                    .foregroundColor(.red)
                    .font(.caption)
                    .padding(.leading, 4)
            }

            // Email
            TextField("Email", text: $viewModel.email)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(viewModel.emailError != nil ? Color.red : Color.clear, lineWidth: 1)
                )

            if let error = viewModel.emailError {
                Text(error)
                    .foregroundColor(.red)
                    .font(.caption)
                    .padding(.leading, 4)
            }

            // Password
            SecureField("Password", text: $viewModel.password)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(viewModel.passwordError != nil ? Color.red : Color.clear, lineWidth: 1)
                )
                .onChange(of: viewModel.password) { _ in
                    viewModel.updatePasswordRequirementsVisibility()
                }


            if let error = viewModel.passwordError {
                Text(error)
                    .foregroundColor(.red)
                    .font(.caption)
                    .padding(.leading, 4)
            }

            if viewModel.showPasswordRequirements {
                VStack(alignment: .leading, spacing: 6) {
                    PasswordRequirementRow(requirement: "Minimum 8 characters", met: viewModel.isPasswordLengthValid)
                }
            }

            // Sign Up Button
            Button("Sign Up") {
                viewModel.signUp()
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.purple)
            .foregroundColor(.white)
            .cornerRadius(12)

            if let generalError = viewModel.generalError {
                Text(generalError)
                    .foregroundColor(.red)
                    .font(.caption)
            }

            Text("or")
                .foregroundColor(.gray)

            // Auth buttons (placeholder)
            AuthButton(icon: "globe", text: "Continue with Google") {}
            AuthButton(icon: "phone", text: "Continue with Phone Number") {}

            // Navigate to login
            HStack {
                Text("Already have an account?")
                NavigationLink("Log in", destination: LoginView())
            }
        }
        .padding()
        .dismissKeyboardOnTap()
    }
}

#Preview {
    SignUpView()
}

