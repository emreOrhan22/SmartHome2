//
//  ProfileViewModel.swift
//  SmartHome
//
//  Created by Emre on 24.04.2025.
//

import Foundation
import SwiftUI

class ProfileViewModel: ObservableObject {
    @AppStorage("profiles") private var profilesData: Data = Data()
    @Published var profiles: [Profile] = []
    
    init() {
        loadProfiles()
    }

    func loadProfiles() {
        if let decoded = try? JSONDecoder().decode([Profile].self, from: profilesData) {
            self.profiles = decoded
        }
    }

    func saveProfiles() {
        if let encoded = try? JSONEncoder().encode(profiles) {
            profilesData = encoded
        }
    }

    func addProfile(_ profile: Profile) {
        profiles.append(profile)
        saveProfiles()
    }

    func deleteProfile(_ profile: Profile) {
        profiles.removeAll { $0.id == profile.id }
        saveProfiles()
    }
    
    func updateProfile(_ updatedProfile: Profile) {
        if let index = profiles.firstIndex(where: { $0.id == updatedProfile.id }) {
            profiles[index] = updatedProfile
            saveProfiles()
        }
    }

}
