//
//  RoomsView.swift
//  SmartHome
//
//  Created by Emre on 21.03.2025.
//

import SwiftUI

struct RoomsView: View {
    var viewModel: HomeViewModel
    
    let rooms = ["Master Bedroom", "Living Room", "Kitchen", "Balcony"]
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(rooms, id: \.self) { room in
                        RoomCard(roomName: room)
                    }
                }
                .padding()
            }
        }
    }
}

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


#Preview {
    MainView()
}
