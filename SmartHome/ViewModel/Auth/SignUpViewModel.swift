//
//  SignUpViewModel.swift
//  SmartHome
//
//  Created by Emre on 26.03.2025.
//

import Foundation
import SwiftUI

class SignUpViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""

    @Published var nameError: String?
    @Published var emailError: String?
    @Published var passwordError: String?
    @Published var generalError: String?
    
    @Published var showPasswordRequirements = false

    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    
    var isPasswordLengthValid: Bool {
        password.count >= 8
    }

    private let authService: AuthServiceProtocol

    init(authService: AuthServiceProtocol = MockAuthService()) {
        self.authService = authService
    }

    func signUp() {
        nameError = nil
        emailError = nil
        passwordError = nil
        generalError = nil

        Task {
            do {
                let success = try await authService.signUp(name: name, email: email, password: password)
                if success {
                    isLoggedIn = true
                }
            } catch {
                generalError = error.localizedDescription
            }
        }
    }
    
    func updatePasswordRequirementsVisibility() {
        showPasswordRequirements = true
    }

}
