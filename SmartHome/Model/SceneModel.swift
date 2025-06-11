//
//  SceneModel.swift
//  SmartHome
//
//  Created by Emre on 7.05.2025.
//

import Foundation

struct SceneModel: Identifiable, Codable, Equatable {
    var id: String?
    var name: String
    var description: String
    var iconName: String
    var iconColorHex: String
    var isActive: Bool
}

