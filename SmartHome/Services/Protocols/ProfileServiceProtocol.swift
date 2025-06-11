//
//  ProfileServiceProtocol.swift
//  SmartHome
//
//  Created by Emre ORHAN on 11.06.2025.
//

import Foundation

protocol ProfileServiceProtocol {
    func fetchProfiles() async -> [Profile]
    func addProfile(_ profile: Profile) async
    func updateProfile(_ profile: Profile) async
    func deleteProfile(withId id: String) async
}

