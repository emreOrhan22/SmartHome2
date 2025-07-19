//
//  LoginViewModel.swift
//  SmartHome
//
//  Created by Emre on 26.03.2025.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var username = ""
    @Published var password = ""

    @Published var usernameError: String?
    @Published var passwordError: String?
    @Published var generalError: String?

    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    @AppStorage("token") var token: String = ""

    func login() async -> Bool {
        usernameError = nil
        passwordError = nil
        generalError = nil

        do {
            let receivedToken = try await APIService.login(username: username, password: password)
            DispatchQueue.main.async {
                self.token = receivedToken
                self.isLoggedIn = true
            }
            return true
        } catch {
            DispatchQueue.main.async {
                self.generalError = "Login Failed: \(error.localizedDescription)"
            }
            return false
        }
    }
}

