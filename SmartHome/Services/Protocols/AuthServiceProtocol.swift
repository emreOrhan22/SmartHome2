//
//  AuthServiceProtocol.swift
//  SmartHome
//
//  Created by Emre ORHAN on 11.06.2025.
//

import Foundation

protocol AuthServiceProtocol {
    func login(email: String, password: String) async throws -> Bool
    func signUp(name: String, email: String, password: String) async throws -> Bool
}

