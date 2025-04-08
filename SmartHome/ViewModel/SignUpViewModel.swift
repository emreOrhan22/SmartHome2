//
//  SignUpViewModel.swift
//  SmartHome
//
//  Created by Emre on 26.03.2025.
//

import SwiftUI

class SignUpViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    
    @Published var nameError: String?
    @Published var emailError: String?
    @Published var passwordError: String?

    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    
    func signUp() {
        nameError = nil
        emailError = nil
        passwordError = nil
        
        var hasError = false
        
        if name.isEmpty {
            nameError = "Name is required."
            hasError = true
        }
        
        if email.isEmpty {
            emailError = "Email is required."
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
    
    var isPasswordLengthValid: Bool {
        password.count >= 8
    }
    
    var showPasswordRequirements: Bool {
        !password.isEmpty
    }

}


