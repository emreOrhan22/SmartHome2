//
//  RoomModel.swift
//  SmartHome
//
//  Created by Emre on 22.03.2025.
//

import Foundation

struct Room: Identifiable, Codable, Equatable {
    var id : String?
    var name: String
    var type: String  
    var iconName: String
}

