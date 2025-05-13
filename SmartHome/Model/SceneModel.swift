//
//  SceneModel.swift
//  SmartHome
//
//  Created by Emre on 7.05.2025.
//

import SwiftUI

struct SceneModel: Identifiable {
    let id = UUID()
    var name: String
    var description: String
    var iconName: String
    var iconColorHex: String
    var isActive: Bool
}

