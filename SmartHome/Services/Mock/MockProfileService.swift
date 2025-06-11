//
//  MockProfileService.swift
//  SmartHome
//
//  Created by Emre ORHAN on 11.06.2025.
//

import Foundation

class MockProfileService: ProfileServiceProtocol {
    private var mockProfiles: [Profile] = [
        Profile(id: "1", name: "Emre", imageName: "father", pin: "1234"),
        Profile(id: "2", name: "Zeynep", imageName: "mother", pin: nil)
    ]

    func fetchProfiles() async -> [Profile] {
        return mockProfiles
    }

    func addProfile(_ profile: Profile) async {
        mockProfiles.append(profile)
    }

    func updateProfile(_ profile: Profile) async {
        if let index = mockProfiles.firstIndex(where: { $0.id == profile.id }) {
            mockProfiles[index] = profile
        }
    }

    func deleteProfile(withId id: String) async {
        mockProfiles.removeAll { $0.id == id }
    }
}

