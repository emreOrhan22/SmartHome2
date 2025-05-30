//
//  RoomCard.swift
//  SmartHome
//
//  Created by Emre on 10.04.2025.
//

import SwiftUI

struct RoomCard: View {
    let room: Room
    @State private var navigate = false

    var body: some View {
        ZStack {
            NavigationLink(destination: destinationView(), isActive: $navigate) {
                EmptyView()
            }
            .hidden()

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
            .onTapGesture {
                navigate = true
            }
        }
    }

    // Hedef ekran: RoomDetailView sarılı olarak
    func destinationView() -> some View {
        AnyView(
            NavigationWrapperView(title: room.name) {
                RoomDetailView(
                    roomName: room.name,
                    roomImageName: room.iconName
                )
            }
        )
    }
}




#Preview {
    RoomCard(room: Room(name: "Kitchen", type: "Kitchen", iconName: "kitchenImage"))
}
