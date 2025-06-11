//
//  ProfileViewModel.swift
//  SmartHome
//
//  Created by Emre on 24.04.2025.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var profiles: [Profile] = []

    private let profileService: ProfileServiceProtocol

    init(profileService: ProfileServiceProtocol = MockProfileService()) {
        self.profileService = profileService
        loadProfiles()
    }

    func loadProfiles() {
        Task {
            self.profiles = await profileService.fetchProfiles()
        }
    }

    func addProfile(_ profile: Profile) {
        Task {
            await profileService.addProfile(profile)
            await loadProfiles()
        }
    }

    func updateProfile(_ profile: Profile) {
        Task {
            await profileService.updateProfile(profile)
            await loadProfiles()
        }
    }

    func deleteProfile(_ profile: Profile) {
        Task {
            await profileService.deleteProfile(withId: profile.id ?? "")
            await loadProfiles()
        }
    }
}

