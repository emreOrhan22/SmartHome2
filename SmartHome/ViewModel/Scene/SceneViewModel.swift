//
//  SceneViewModel.swift
//  SmartHome
//
//  Created by Emre on 7.05.2025.
//

import Foundation

class SceneViewModel: ObservableObject {
    @Published var scenes: [SceneModel] = []

    private let sceneService: SceneServiceProtocol

    init(sceneService: SceneServiceProtocol = MockSceneService()) {
        self.sceneService = sceneService
        loadScenes()
    }

    func loadScenes() {
        Task {
            self.scenes = await sceneService.fetchScenes()
        }
    }

    func toggleScene(at index: Int) {
        guard index < scenes.count else { return }
        let selectedSceneId = scenes[index].id ?? ""

        Task {
            await sceneService.activateScene(withId: selectedSceneId)
            await loadScenes() // Refresh all to reflect active state change
        }
    }

    func addScene(name: String, description: String, iconName: String, iconColorHex: String) {
        let newScene = SceneModel(
            id: UUID().uuidString,
            name: name,
            description: description,
            iconName: iconName,
            iconColorHex: iconColorHex,
            isActive: false
        )

        Task {
            await sceneService.addScene(newScene)
            await loadScenes()
        }
    }

    func deleteScene(at index: Int) {
        guard index < scenes.count else { return }
        let sceneId = scenes[index].id ?? ""

        Task {
            await sceneService.deleteScene(withId: sceneId)
            await loadScenes()
        }
    }
}
