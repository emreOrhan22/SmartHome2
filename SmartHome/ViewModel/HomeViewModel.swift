//
//  HomeViewModel.swift
//  SmartHome
//
//  Created by Emre on 20.03.2025.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var devices: [Device] = []
    @Published var rooms: [Room] = []

    // Başlangıçta örnek odalar ve cihazlar ekleyelim
    init() {
        // Örnek odalar
        let livingRoom = Room(name: "Living Room", type: "Living Room", iconName: "livingRoomImage")
        let kitchen = Room(name: "Kitchen", type: "Kitchen", iconName: "kitchenImage")
        let bedroom = Room(name: "Bedroom", type: "Bedroom", iconName: "bedroomImage")
        let bathroom = Room(name: "Bathroom", type: "Bathroom", iconName: "bathroomImage")

        rooms.append(livingRoom)
        rooms.append(kitchen)
        rooms.append(bedroom)
        rooms.append(bathroom)

        // Örnek cihazlar ve odalara ata
        devices.append(Device(name: "Living Room Light", isOn: false, type: .light, roomId: livingRoom.id))
        devices.append(Device(name: "Air Conditioner", isOn: false, tempature: 23, type: .airConditioner, roomId: livingRoom.id))

        devices.append(Device(name: "Kitchen Light", isOn: false, type: .light, roomId: kitchen.id))
        devices.append(Device(name: "Bedroom Light", isOn: false, type: .light, roomId: bedroom.id))
        devices.append(Device(name: "Heater", isOn: false, tempature: 20, type: .thermostat, roomId: bedroom.id))
        devices.append(Device(name: "Bathroom Light", isOn: false, type: .light, roomId: bathroom.id))
    }
    
    func statusText(for device: Device) -> String {
        if !device.isOn {
            return "Off"
        }

        switch device.type {
        case .airConditioner, .thermostat:
            return "On • \(device.tempature ?? 23)°C"
        case .light:
            return "On"
        case .curtain:
            return "On"
        case .plug:
            return "Active"
        }
    }



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
