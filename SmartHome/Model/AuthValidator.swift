//
//  AuthValidator.swift
//  SmartHome
//
//  Created by Emre on 26.03.2025.
//

import Foundation

struct AuthValidator {
    static func validateLogin(email: String, password: String) -> String? {
        if email.isEmpty {
            return "Please enter your email address."
        }
        if !email.contains("@") || !email.contains(".") {
            return "Please enter a valid email address."
        }
        if password.isEmpty {
            return "Please enter your password."
        }
        if password.count < 8 {
            return "Password must be at least 8 characters long."
        }
        return nil
    }

    static func validateSignUp(name: String, email: String, password: String) -> String? {
        if name.isEmpty {
            return "Please enter your name."
        }
        return validateLogin(email: email, password: password)
    }
}

