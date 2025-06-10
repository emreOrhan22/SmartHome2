//
//  SceneViewModel.swift
//  SmartHome
//
//  Created by Emre on 7.05.2025.
//

import SwiftUI

class SceneViewModel: ObservableObject {
    @Published var scenes: [SceneModel] = [
        SceneModel(
            name: "Relax",
            description: "Lights at 50%, Curtains closed, AC set to 23°C",
            iconName: "sofa.fill",
            iconColorHex: "#4A90E2",
            isActive: false
        ),
        SceneModel(
            name: "Morning",
            description: "Lights at 100%, Curtains open, AC off",
            iconName: "sun.max.fill",
            iconColorHex: "#F5A623",
            isActive: false
        ),
        SceneModel(
            name: "Good Night",
            description: "Lights off, Curtains closed, AC set to 21°C",
            iconName: "moon.fill",
            iconColorHex: "#4A4A4A",
            isActive: false
        ),
        SceneModel(
            name: "Party",
            description: "Color lights, Curtains closed, AC set to 20°C",
            iconName: "sparkles",
            iconColorHex: "#D0027F",
            isActive: false
        )
    ]
    
    func toggleScene(at index: Int) {
        for i in scenes.indices {
            scenes[i].isActive = (i == index) ? !scenes[i].isActive : false
        }
    }
}

