//
//  MockDeviceService.swift
//  SmartHome
//
//  Created by Emre ORHAN on 11.06.2025.
//

import Foundation

class MockDeviceService: DeviceServiceProtocol {
    func fetchDevices(forRoom roomId: String) async -> [Device] {
        return [
            Device(id: "1", name: "Lamp", isOn: true, temperature: nil, type: .light, roomId: roomId),
            Device(id: "2", name: "AC", isOn: false, temperature: 24, type: .airConditioner, roomId: roomId),
            Device(id: "3", name: "Curtain", isOn: false, temperature: nil, type: .curtain, roomId: roomId ),
            Device(id: "4", name: "Plug", isOn: false, temperature: nil, type: .plug, roomId: roomId ),
            Device(id: "5", name: "Thermostat", isOn: false, temperature: 22, type: .thermostat, roomId: roomId )
            
        ]
    }

    func updateDeviceState(_ device: Device) async {
        print("Mock: Updating device \(device.name) to \(device.isOn ? "ON" : "OFF")")
    }
}

