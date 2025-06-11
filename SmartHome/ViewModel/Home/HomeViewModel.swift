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

    private let deviceService: DeviceServiceProtocol
    private let roomService: RoomServiceProtocol

    init(
        deviceService: DeviceServiceProtocol = MockDeviceService(),
        roomService: RoomServiceProtocol = MockRoomService()
    ) {
        self.deviceService = deviceService
        self.roomService = roomService
        loadRooms()
    }

    func loadRooms() {
        Task {
            self.rooms = await roomService.fetchRooms()

            // İlk odaya ait cihazları yükleyelim (örnek kullanım)
            if let firstRoom = rooms.first {
                await loadDevices(forRoom: firstRoom.id ?? "")
            }
        }
    }

    func loadDevices(forRoom roomId: String) async {
        self.devices = await deviceService.fetchDevices(forRoom: roomId)
    }

    func toggleDevice(_ device: Device) {
        guard let index = devices.firstIndex(where: { $0.id == device.id }) else { return }
        devices[index].isOn.toggle()

        Task {
            await deviceService.updateDeviceState(devices[index])
        }
    }

    func statusText(for device: Device) -> String {
        if !device.isOn { return "Off" }

        switch device.type {
        case .airConditioner, .thermostat:
            return "On • \(device.temperature ?? 23)°C"
        case .light:
            return "On"
        case .curtain:
            return "On"
        case .plug:
            return "Active"
        }
    }

    func addRoom(name: String, type: String, iconName: String) {
        let newRoom = Room(id: UUID().uuidString, name: name, type: type, iconName: iconName)
        Task {
            await roomService.addRoom(newRoom)
            await loadRooms()
        }
    }

}
