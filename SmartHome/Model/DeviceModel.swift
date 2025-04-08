//
//  DeviceModel.swift
//  SmartHome
//
//  Created by Emre on 20.03.2025.
//

import Foundation

struct Device: Identifiable, Codable {
    var id: UUID = UUID()
    var name: String
    var isOn : Bool
    var tempature: Int?
    
}
