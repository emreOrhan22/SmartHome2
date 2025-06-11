//
//  RoomDetailViewModel.swift
//  SmartHome
//
//  Created by Emre ORHAN on 27.05.2025.
//

import SwiftUI

class RoomDetailViewModel: ObservableObject {
    @Published var devices: [Device]

    init() {
        devices = [
            Device(id: UUID().uuidString, name: "Smart Light", isOn: true, temperature: nil, type: .light, roomId: "1"),
            Device(id: UUID().uuidString, name: "Air Conditioner", isOn: true, temperature: 23, type: .airConditioner, roomId: "1"),
            Device(id: UUID().uuidString, name: "Smart Curtain", isOn: false, temperature: nil, type: .curtain, roomId: "1"),
            Device(id: UUID().uuidString, name: "Smart Plug", isOn: false, temperature: nil, type: .plug, roomId: "1"),
            Device(id: UUID().uuidString, name: "Thermostat", isOn: false, temperature: 23, type: .thermostat, roomId: "1")
        ]

    }

    func toggleDevice(_ device: Device) {
        if let index = devices.firstIndex(where: { $0.id == device.id }) {
            devices[index].isOn.toggle()
        }
    }


    func iconName(for type: DeviceType) -> String {
        switch type {
        case .light:
            return "lightbulb.fill"
        case .airConditioner:
            return "wind"
        case .curtain:
            return "curtains.closed"
        case .thermostat:
            return "thermometer"
        case .plug:
            return "powerplug"
        }
    }

    func statusText(for device: Device) -> String {
        switch device.type {
        case .light:
            return "Brightness: 100%"
        case .airConditioner:
            if let temp = device.temperature {
                return "Temperature: \(temp)°C"
            }
            return "Temperature: N/A"
        case .curtain:
            return device.isOn ? "OPENED" : "CLOSED"
        default:
            return device.isOn ? "ON" : "OFF"
        }
    }

    func destinationView(for type: DeviceType) -> AnyView {
        switch type {
        case .light:
            return AnyView(LightDetailView())
        case .airConditioner:
            return AnyView(AirConditionerDetailView())
        case .curtain:
            return AnyView(CurtainDetailView())
        case .plug:
            return AnyView(PlugDetailView())
        case .thermostat:
            return AnyView(ThermostatView())
        default:
            return AnyView(Text("Coming Soon"))
        }
    }
}

