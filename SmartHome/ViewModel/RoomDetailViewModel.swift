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
            Device(name: "Smart Light", isOn: true, tempature: nil, type: .light),
            Device(name: "Air Conditioner", isOn: true, tempature: 23, type: .airConditioner),
            Device(name: "Smart Curtain", isOn: false, tempature: nil, type: .curtain),
            Device(name: "Smart Plug", isOn: false, tempature: nil, type: .plug),
            Device(name: "Thermostat", isOn: false, tempature: 23, type: .thermostat)
        ]
    }

    func toggleDevice(_ device: Device) {
        if let index = devices.firstIndex(where: { $0.id == device.id }) {
            devices[index].isOn.toggle()
        }
    }

    // MARK: - UI Helpers

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
            return "Brightness: 80%"
        case .airConditioner:
            if let temp = device.tempature {
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

