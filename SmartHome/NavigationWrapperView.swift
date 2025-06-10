//
//  NavigationWrapperView.swift
//  SmartHome
//
//  Created by Emre on 24.04.2025.
//

import SwiftUI

struct NavigationWrapperView<Content: View>: View {
    var title: String
    var content: () -> Content

    var body: some View {
        NavigationStack {
            content()
                .navigationTitle(title)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

