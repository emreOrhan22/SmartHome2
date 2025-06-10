//
//  RoomsView.swift
//  SmartHome
//
//  Created by Emre on 21.03.2025.
//

import SwiftUI

struct RoomsView: View {
    @ObservedObject var viewModel: HomeViewModel
    @State private var showAddRoomSheet = false
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]

    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(viewModel.rooms) { room in
                    NavigationLink(destination:
                                    RoomDetailView(roomName: room.name, roomImageName: room.iconName)
                    ) {
                        RoomCard(room: room)
                    }
                }
            }
            .padding(.horizontal, 16) 
            .padding(.top, 8)
        }
    }
}
#Preview {
    MainView()
}
