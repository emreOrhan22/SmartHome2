//
//  ProfileModel.swift
//  SmartHome
//
//  Created by Emre on 22.04.2025.
//

import Foundation

struct Profile: Identifiable, Codable, Equatable {
    var id: UUID = UUID()
    var name: String
    var imageName: String
    var pin: String?

    init(id: UUID = UUID(), name: String, imageName: String, pin: String? = nil) {
        self.id = id
        self.name = name
        self.imageName = imageName
        self.pin = pin
    }
}


