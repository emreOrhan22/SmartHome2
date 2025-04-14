//
//  InitialAvatarView.swift
//  SmartHome
//
//  Created by Emre on 11.04.2025.
//

import SwiftUI

struct InitialAvatarView: View {
    var name: String
    var size: CGFloat = 32

    var body: some View {
        Text(initials(from: name))
            .font(.system(size: size * 0.45))
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .frame(width: size, height: size)
            .background(
                Circle()
                    .fill(LinearGradient(
                        gradient: Gradient(colors: [Color.gray.opacity(0.85), Color.gray]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ))
            )
    }

    private func initials(from fullName: String) -> String {
        let components = fullName.split(separator: " ")
        let initials = components.prefix(2).compactMap { $0.first }
        return initials.map { String($0) }.joined().uppercased()
    }
}

#Preview {
    HStack(spacing: 12) {
        InitialAvatarView(name: "Simay Çevik")
        InitialAvatarView(name: "Emre Orhan")
    }
    .padding()
    .previewLayout(.sizeThatFits)
}

