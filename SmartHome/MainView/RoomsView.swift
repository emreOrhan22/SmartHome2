//
//  RoomsView.swift
//  SmartHome
//
//  Created by Emre on 21.03.2025.
//

import SwiftUI

struct RoomsView: View {
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Rooms")
                .font(.title2)
                .bold()
                .padding(.bottom, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(viewModel.rooms) { room in
                        RoomCard(name: room.name, image: room.iconName)
                    }
                }
            }
        }
    }
}

struct RoomCard: View {
    var name: String
    var image: String
    
    var body: some View {
        VStack {
            Image(systemName: image)
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(.white)
            Text(name)
                .foregroundColor(.white)
        }
        .frame(width: 120, height: 120)
        .background(RoundedRectangle(cornerRadius: 15).fill(Color.blue))
    }
}


#Preview {
    MainView()
}
