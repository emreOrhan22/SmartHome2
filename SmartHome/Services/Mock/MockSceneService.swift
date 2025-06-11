//
//  MockSceneService.swift
//  SmartHome
//
//  Created by Emre ORHAN on 11.06.2025.
//

import Foundation

class MockSceneService: SceneServiceProtocol {
    private var mockScenes: [SceneModel] = [
        SceneModel(id: "1", name: "Relax", description: "Lights 50%, Curtains closed, AC 23°C", iconName: "sofa.fill", iconColorHex: "#4A90E2", isActive: false),
        SceneModel(id: "2", name: "Morning", description: "Lights 100%, Curtains open, AC off", iconName: "sun.max.fill", iconColorHex: "#F5A623", isActive: false),
        SceneModel(id: "3", name: "Good Night", description: "Lights off, Curtains closed, AC 21°C", iconName: "moon.fill", iconColorHex: "#4A4A4A", isActive: false)
    ]

    func fetchScenes() async -> [SceneModel] {
        return mockScenes
    }

    func activateScene(withId id: String) async {
        for i in mockScenes.indices {
            mockScenes[i].isActive = (mockScenes[i].id == id)
        }
    }

    func addScene(_ scene: SceneModel) async {
        mockScenes.append(scene)
    }

    func deleteScene(withId id: String) async {
        mockScenes.removeAll { $0.id == id }
    }
}

