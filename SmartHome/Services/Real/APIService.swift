//
//  APIService.swift
//  SmartHome
//
//  Created by Emre ORHAN on 19.06.2025.
//

import Foundation

// Giriş isteği modeli
struct LoginRequest: Codable {
    let username: String
    let password: String
}

// Giriş yanıtı modeli
struct LoginResponse: Codable {
    let token: String
}

struct APIService {
    static let baseURL = "https://api.akilli-ev.online"

    //  Giriş fonksiyonu
    static func login(username: String, password: String) async throws -> String {
        guard let url = URL(string: "\(baseURL)/login") else {
            throw URLError(.badURL)
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let body = LoginRequest(username: username, password: password)
        request.httpBody = try JSONEncoder().encode(body)

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }

        let decoded = try JSONDecoder().decode(LoginResponse.self, from: data)
        return decoded.token
    }

    //  Cihaz loglarını çekme fonksiyonu
    static func getDeviceLogs(token: String) async throws -> [DeviceLog] {
        guard let url = URL(string: "\(baseURL)/get_all") else {
            throw URLError(.badURL)
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let body = ["token": token]
        request.httpBody = try JSONSerialization.data(withJSONObject: body)

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }

        return try JSONDecoder().decode([DeviceLog].self, from: data)
    }
}
