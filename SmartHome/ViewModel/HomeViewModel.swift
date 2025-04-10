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
    
    func addRoom(name: String, type: String, icon: String) {
        // Geçici olarak sadece adını ekliyoruz
        rooms.append(name)
        // İleride type ve icon’u da bir model ile birlikte kullanacağız
    }
    
    func toggleDevice(_ device: Device) {
        if let index = devices.firstIndex(where: {$0.id == device.id}) {
            devices[index].isOn.toggle()
        }
    }
}
