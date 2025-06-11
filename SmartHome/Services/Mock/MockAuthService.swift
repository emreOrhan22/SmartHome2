//
//  MockAuthService.swift
//  SmartHome
//
//  Created by Emre ORHAN on 11.06.2025.
//

import Foundation

enum AuthError: Error, LocalizedError {
    case invalidCredentials
    case emailAlreadyExists

    var errorDescription: String? {
        switch self {
        case .invalidCredentials:
            return "Incorrect email or password."
        case .emailAlreadyExists:
            return "Email already exists."
        }
    }
}

class MockAuthService: AuthServiceProtocol {
    private var users: [(name: String, email: String, password: String)] = [
        ("Emre", "emre@mail.com", "12345678")
    ]

    func login(email: String, password: String) async throws -> Bool {
        if users.contains(where: { $0.email == email && $0.password == password }) {
            return true
        } else {
            throw AuthError.invalidCredentials
        }
    }

    func signUp(name: String, email: String, password: String) async throws -> Bool {
        if users.contains(where: { $0.email == email }) {
            throw AuthError.emailAlreadyExists
        }

        users.append((name: name, email: email, password: password))
        return true
    }
}

