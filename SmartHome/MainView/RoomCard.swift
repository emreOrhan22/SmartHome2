//
//  RoomCard.swift
//  SmartHome
//
//  Created by Emre on 10.04.2025.
//

import SwiftUI

struct RoomCard: View {
    let room: Room

    var body: some View {
        VStack(spacing: 0) {
            Image(room.iconName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 90)
                .clipped()

            Text(room.name)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.blue)
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



struct AddRoomCard: View {
    var onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            VStack(spacing: 12) {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.purple)
                Text("Add Room")
                    .fontWeight(.medium)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
        }
        .frame(height: 200)
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: .gray.opacity(0.3), radius: 6, x: 0, y: 4)
    }
}

#Preview {
    RoomCard(room: Room(name: "Kitchen", type: "Kitchen", iconName: "kitchenImage"))
}
