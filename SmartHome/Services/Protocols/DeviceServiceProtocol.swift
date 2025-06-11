//
//  DeviceServiceProtocol.swift
//  SmartHome
//
//  Created by Emre ORHAN on 11.06.2025.
//

import Foundation

protocol DeviceServiceProtocol {
    func fetchDevices(forRoom roomId: String) async -> [Device]
    func updateDeviceState(_ device: Device) async
}

