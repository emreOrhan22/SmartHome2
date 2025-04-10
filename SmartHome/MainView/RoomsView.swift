//
//  RoomsView.swift
//  SmartHome
//
//  Created by Emre on 21.03.2025.
//

import SwiftUI

struct RoomsView: View {
    @ObservedObject var viewModel: HomeViewModel
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(viewModel.rooms, id: \.self) { room in
                RoomCard(roomName: "kitchen")
            }
            AddRoomCard {
                viewModel.addRoom()
            }
        }
        .padding()
    }
}



#Preview {
    MainView()
}
