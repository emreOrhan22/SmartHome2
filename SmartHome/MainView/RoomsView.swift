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
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    // Odaları listele
                    ForEach(viewModel.rooms) { room in
                        RoomCard(room: room)
                    }

                    // + Ekleme kartı
                    Button(action: {
                        showAddRoomSheet = true
                    }) {
                        VStack(spacing: 12) {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.purple)
                            Text("Add Room")
                                .fontWeight(.medium)
                                .foregroundColor(.primary)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding()
                        .frame(height: 200)
                        .background(Color.white)
                        .cornerRadius(16)
                        .shadow(color: .gray.opacity(0.3), radius: 6, x: 0, y: 4)
                    }
                }
                .padding()
            }
            .sheet(isPresented: $showAddRoomSheet) {
                AddRoomSheetView(viewModel: viewModel, isPresented: $showAddRoomSheet)
            }
        }
    }
}


#Preview {
    MainView()
}

