//
//  ScenesView.swift
//  SmartHome
//
//  Created by Emre on 7.05.2025.
//

import SwiftUI

struct ScenesView: View {
    @StateObject private var viewModel = SceneViewModel()

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(viewModel.scenes.indices, id: \.self) { index in
                        SceneCardView(
                            scene: viewModel.scenes[index],
                            isActive: viewModel.scenes[index].isActive
                        ) {
                            viewModel.toggleScene(at: index)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Scenes")
        }
    }
}

#Preview {
    ScenesView()
}

