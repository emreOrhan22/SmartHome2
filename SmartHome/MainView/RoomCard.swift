//
//  RoomCard.swift
//  SmartHome
//
//  Created by Emre on 10.04.2025.
//

import SwiftUI

struct RoomCard: View {
    let roomName: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Image("placeholder")
                .resizable()
                .scaledToFill()
                .frame(height: 120)
                .clipped()
            
            Text(roomName)
                .font(.headline)
                .padding([.leading, .bottom, .trailing], 8)
        }
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: .gray.opacity(0.3), radius: 6, x: 0, y: 4)
    }
}

struct AddRoomCard: View {
    var onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            VStack {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.purple)
                Text("Add Room")
                    .fontWeight(.medium)
            }
            .frame(maxWidth: .infinity, minHeight: 120)
            .background(Color.white)
            .cornerRadius(16)
            .shadow(color: .gray.opacity(0.3), radius: 6, x: 0, y: 4)
        }
    }
}


#Preview {
    RoomCard(roomName: "Kitchen")
}
