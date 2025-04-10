//
//  HomeViewModel.swift
//  SmartHome
//
//  Created by Emre on 20.03.2025.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var devices: [Device] = [
        Device(name: "Living Room Light", isOn: false),
        Device(name: "Kitchen Light", isOn: false),
        Device(name: "Air Conditioner", isOn: false, tempature: 23)
    ]
    
    @Published var rooms: [String] = []
    
    func addRoom() {
            rooms.append("New Room \(rooms.count + 1)")
        }
    
    func toggleDevice(_ device: Device) {
        if let index = devices.firstIndex(where: {$0.id == device.id}) {
            devices[index].isOn.toggle()
        }
    }
}
