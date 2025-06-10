//
//  ProfileCardView.swift
//  SmartHome
//
//  Created by Emre on 24.04.2025.
//

import SwiftUI

struct ProfileCardView: View {
    let profile: Profile
    let isEditing: Bool
    let isSelected: Bool
    let onSelect: () -> Void
    let onDelete: () -> Void
    let onEditTapped: () -> Void

    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack(spacing: 4) {
                Image(profile.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())

                Text(profile.name)
                    .font(.subheadline)

                Image(systemName: "lock.fill")
                    .font(.caption2)
                    .foregroundColor((profile.pin != nil && !profile.pin!.isEmpty) ? .gray : .clear)
            }
            .scaleEffect(isSelected ? 1.2 : 1.0)
            .animation(.spring(), value: isSelected)
            .onTapGesture {
                if !isEditing {
                    onSelect()
                }
            }

            if isEditing {
                HStack(spacing: 8) {
                    Button(action: onEditTapped) {
                        Image(systemName: "pencil.circle.fill")
                            .font(.title3)
                            .foregroundColor(.blue)
                            .background(Color.white)
                            .clipShape(Circle())
                    }

                    Button(action: onDelete) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.red)
                            .background(Color.white)
                            .clipShape(Circle())
                    }
                }
                .offset(x: 10, y: -10)
            }
        }
    }
}

#Preview {
    ProfileCardView(
        profile: Profile(name: "Test", imageName: "boy", pin: nil),
        isEditing: true,
        isSelected: false,
        onSelect: {},
        onDelete: {},
        onEditTapped: {}
    )
}
