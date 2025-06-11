//
//  RoomServiceProtocol.swift
//  SmartHome
//
//  Created by Emre ORHAN on 11.06.2025.
//

import Foundation

protocol RoomServiceProtocol {
    func fetchRooms() async -> [Room]
    func addRoom(_ room: Room) async
    func deleteRoom(withId id: String) async
}

