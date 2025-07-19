//
//  RoomCard.swift
//  SmartHome
//
//  Created by Emre on 10.04.2025.
//

import SwiftUI

struct RoomCard: View {
    let areaName: String
    let iconName: String
    let deviceCount: Int // Sadece sayı geliyor

    var body: some View {
        VStack(spacing: 0) {
            Image(iconName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 90)
                .clipped()

            VStack(spacing: 4) {
                Text(areaName.replacingOccurrences(of: "_", with: " ").capitalized)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.blue)

                Text("\(deviceCount) device\(deviceCount != 1 ? "s" : "")")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity)
            .background(Color.white)
        }
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 3)
        .frame(height: 160)
    }
}

#Preview {
    RoomCard(
        areaName: "living_room",
        iconName: "livingRoomImage",
        deviceCount: 3
    )
}
