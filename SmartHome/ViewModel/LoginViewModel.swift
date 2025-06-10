//
//  LoginViewModel.swift
//  SmartHome
//
//  Created by Emre on 26.03.2025.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""

    @Published var emailError: String?
    @Published var passwordError: String?

    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    @AppStorage("isProfileSelected") var isProfileSelected: Bool = false

    func login() {
        emailError = nil
        passwordError = nil

        var hasError = false

        if email.isEmpty {
            emailError = "Email is required."
            hasError = true
        } else if !email.contains("@") || !email.contains(".") {
            emailError = "Invalid email format."
            hasError = true
        }

        if password.isEmpty {
            passwordError = "Password is required."
            hasError = true
        } else if password.count < 8 {
            passwordError = "Password must be at least 8 characters."
            hasError = true
        }

        if !hasError {
            isLoggedIn = true
        }
    }
}


