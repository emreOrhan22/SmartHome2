//
//  DeviceModel.swift
//  SmartHome
//
//  Created by Emre on 20.03.2025.
//

import Foundation

struct Device: Identifiable, Codable, Equatable {
    var id: String?
    var name: String
    var isOn: Bool
    var temperature: Int?
    var type: DeviceType
    var roomId: String?
}

enum DeviceType: String, Codable, CaseIterable {
    case light
    case airConditioner
    case curtain
    case thermostat
    case plug
}


