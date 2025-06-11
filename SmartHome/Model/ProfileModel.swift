//
//  ProfileModel.swift
//  SmartHome
//
//  Created by Emre on 22.04.2025.
//

struct Profile: Identifiable, Codable, Equatable {
    var id: String? // Backend'den gelecek
    var name: String
    var imageName: String
    var pin: String?

    init(id: String? = nil, name: String, imageName: String, pin: String? = nil) {
        self.id = id
        self.name = name
        self.imageName = imageName
        self.pin = pin
    }
}

