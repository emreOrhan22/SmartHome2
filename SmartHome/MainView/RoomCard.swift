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
        VStack(alignment: .leading, spacing: 0) {
            Image(room.iconName)
                .resizable()
                .scaledToFill()
                .frame(height: 130)
                .clipped()
                .cornerRadius(12)
                .padding(.top, 4) 
                .padding(.horizontal, 8)
                .padding(.bottom, 12)

            Text(room.name)
                .font(.headline)
                .padding([.leading, .bottom, .trailing], 12)
        }
        .frame(height: 200)
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: .gray.opacity(0.3), radius: 6, x: 0, y: 4)
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
