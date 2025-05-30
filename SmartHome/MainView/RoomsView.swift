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
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(viewModel.rooms) { room in
                RoomCard(room: room)
            }
            AddRoomCard {
                showAddRoomSheet = true
            }
        }
        .padding()
        .sheet(isPresented: $showAddRoomSheet) {
                    AddRoomSheetView(viewModel: viewModel, isPresented: $showAddRoomSheet)
        }
    }
}



#Preview {
    MainView()
}
