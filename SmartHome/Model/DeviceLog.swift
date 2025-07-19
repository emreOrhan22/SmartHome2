//
//  DeviceLog.swift
//  SmartHome
//
//  Created by Emre ORHAN on 19.06.2025.
//

import Foundation

struct DeviceLog: Codable, Identifiable {
    var id: UUID { UUID() } // Listelerde kullanılmak için
    let area: String
    let date: String
    let deviceid: String
    let level: String
    let state: String
    let type: String
    let value: String
}

