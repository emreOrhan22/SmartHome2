//
//  LoginViewModel.swift
//  SmartHome
//
//  Created by Emre on 26.03.2025.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""

    @Published var emailError: String?
    @Published var passwordError: String?
    @Published var generalError: String?

    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false

    private let authService: AuthServiceProtocol

    init(authService: AuthServiceProtocol = MockAuthService()) {
        self.authService = authService
    }

    func login() {
        emailError = nil
        passwordError = nil
        generalError = nil

        Task {
            do {
                let success = try await authService.login(email: email, password: password)
                if success {
                    isLoggedIn = true
                }
            } catch {
                generalError = error.localizedDescription
            }
        }
    }
}
