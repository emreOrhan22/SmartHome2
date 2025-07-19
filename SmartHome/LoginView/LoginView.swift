//
//  LoginView.swift
//  SmartHome
//
//  Created by Emre on 26.03.2025.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    @State private var navigateToProfile = false

    var body: some View {
        VStack(spacing: 24) {
            Spacer()

            Text("Log In")
                .font(.largeTitle)
                .fontWeight(.bold)

            VStack(spacing: 16) {
                TextField("Username", text: $viewModel.username)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)

                SecureField("Password", text: $viewModel.password)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
            }
            .padding(.horizontal)

            if let error = viewModel.generalError {
                Text("Login Failed: \(error)")
                    .foregroundColor(.red)
                    .font(.footnote)
                    .padding(.horizontal)
            }

            Button(action: {
                Task {
                    let success = await viewModel.login()
                    if success {
                        isLoggedIn = true
                        navigateToProfile = true
                    }
                }
            }) {
                Text("Log In")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding(.horizontal)

            Spacer()
        }
        .background(Color.white)
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .fullScreenCover(isPresented: $navigateToProfile) {
            ProfileSelectionView()
        }
    }
}


#Preview {
    LoginView()
}
