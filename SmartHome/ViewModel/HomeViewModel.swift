//
//  HomeViewModel.swift
//  SmartHome
//
//  Created by Emre on 20.03.2025.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var devices: [Device] = [
        Device(name: "Living Room Light", isOn: false ,type: .light),
        Device(name: "Kitchen Light", isOn: false ,type: .light),
        Device(name: "Air Conditioner", isOn: false, tempature: 23 ,type: .airConditioner),
        Device(name: "Thermostat", isOn: false, tempature: 21 ,type: .thermostat),
        Device(name: "Living Room Curtain", isOn: false, type: .curtain),
        Device(name: "Smart Plug", isOn: false, type: .plug)
    ]

    
    @Published var rooms: [Room] = []

    func addRoom(name: String, type: String, iconName: String) {
        let newRoom = Room(name: name, type: type, iconName: iconName)
        rooms.append(newRoom)
    }
    
    func toggleDevice(_ device: Device) {
        if let index = devices.firstIndex(where: {$0.id == device.id}) {
            devices[index].isOn.toggle()
        }
    }
}
