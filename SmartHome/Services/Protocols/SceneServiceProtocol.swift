//
//  SceneServiceProtocol.swift
//  SmartHome
//
//  Created by Emre ORHAN on 11.06.2025.
//

import Foundation

protocol SceneServiceProtocol {
    func fetchScenes() async -> [SceneModel]
    func activateScene(withId id: String) async
    func addScene(_ scene: SceneModel) async
    func deleteScene(withId id: String) async
}

