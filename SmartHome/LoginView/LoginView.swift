//
//  LoginView.swift
//  SmartHome
//
//  Created by Emre on 26.03.2025.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()

    var body: some View {
        VStack(spacing: 20) {
            Text("Log In")
                .font(.largeTitle)
                .bold()

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

            SecureField("Password", text: $viewModel.password)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(viewModel.passwordError != nil ? Color.red : Color.clear, lineWidth: 1)
                )
            if let error = viewModel.passwordError {
                Text(error)
                    .foregroundColor(.red)
                    .font(.caption)
                    .padding(.leading, 4)
            }

            Button("Log In") {
                viewModel.login()
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.purple)
            .foregroundColor(.white)
            .cornerRadius(12)

            Text("or")
                .foregroundColor(.gray)

            AuthButton(icon: "globe", text: "Continue with Google") {}
            AuthButton(icon: "phone", text: "Continue with Phone Number") {}

            HStack {
                Text("Don't have an account?")
                NavigationLink("Sign up", destination: SignUpView())
            }
        }
        .padding()
        .dismissKeyboardOnTap()
        }
    }



#Preview {
    LoginView()
}
