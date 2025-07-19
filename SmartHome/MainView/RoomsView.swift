//
//  RoomsView.swift
//  SmartHome
//
//  Created by Emre on 21.03.2025.
//

import SwiftUI

struct RoomsView: View {
    // İleride geri açmak için ViewModel'i burada tuttuk
    // @ObservedObject var viewModel: HomeViewModel

    // Oda ekleme sheet'i (gelecekte kullanılabilir)
    // @State private var showAddRoomSheet = false

    // Oda kartlarının dizilimi
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]

    var body: some View {
        VStack {
            Text("Rooms özelliği şu anda devre dışı.")
                .foregroundColor(.gray)
                .padding()

            // Gelecekte şu yapı aktif edilecek:
            /*
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
            */
        }
    }
}

// #Preview {
//     RoomsView(viewModel: HomeViewModel())
// }

