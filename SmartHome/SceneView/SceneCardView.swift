//
//  SceneCardView.swift
//  SmartHome
//
//  Created by Emre on 7.05.2025.
//

import SwiftUI

struct SceneCardView: View {
    let scene: SceneModel
    let isActive: Bool
    let onToggle: () -> Void

    var body: some View {
        HStack(spacing: 16) {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(hex: scene.iconColorHex))
                    .frame(width: 50, height: 50)
                Image(systemName: scene.iconName)
                    .foregroundColor(.white)
                    .font(.system(size: 24))
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(scene.name)
                    .font(.headline)

                Text(scene.description)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .lineLimit(2)
            }

            Spacer()

            Toggle("", isOn: .constant(scene.isActive))
                .labelsHidden()
                .onTapGesture {
                    onToggle()
                }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(15)
        .shadow(radius: 2)
    }
}

#Preview {
    SceneCardView(
        scene: SceneModel(
            name: "Relax",
            description: "Lights at 50%, Curtains closed, AC set to 23°C",
            iconName: "sofa.fill",
            iconColorHex: "#4A90E2",
            isActive: true
        ),
        isActive: true,
        onToggle: { print("Toggled") }
    )
    .previewLayout(.sizeThatFits)
    .padding()
}

