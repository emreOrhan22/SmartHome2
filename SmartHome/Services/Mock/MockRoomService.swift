//
//  MockRoomService.swift
//  SmartHome
//
//  Created by Emre ORHAN on 11.06.2025.
//

import Foundation

class MockRoomService: RoomServiceProtocol {
    private var mockRooms: [Room] = [
        Room(id: "1", name: "Living Room", type: "Living Room", iconName: "livingRoomImage"),
        Room(id: "2", name: "Kitchen", type: "Kitchen", iconName: "kitchenImage"),
        Room(id: "3", name: "Bedroom", type: "Bedroom", iconName: "bedroomImage"),
        Room(id: "4", name: "Bathroom", type: "Bathroom", iconName: "bathroomImage")
    ]

    func fetchRooms() async -> [Room] {
        return mockRooms
    }

    func addRoom(_ room: Room) async {
        mockRooms.append(room)
    }

    func deleteRoom(withId id: String) async {
        mockRooms.removeAll { $0.id == id }
    }
}

