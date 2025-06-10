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
    var type: DeviceType
    var roomId: UUID?
    
}
enum DeviceType: String, Codable {
    case light
    case airConditioner
    case curtain
    case thermostat
    case plug
}

