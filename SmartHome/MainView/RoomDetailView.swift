//
//  RoomDetailView.swift
//  SmartHome
//
//  Created by Emre on 13.05.2025.
//

import SwiftUI

struct RoomDetailView: View {
    @ObservedObject var viewModel = RoomDetailViewModel()
    
    var roomName: String
    var roomImageName: String

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(spacing: 0) {
                    GeometryReader { geo in
                        let yOffset = geo.frame(in: .global).minY
                        
                        Image(roomImageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: geometry.size.width,
                                   height: yOffset > 0 ? 250 + yOffset : 250)
                            .clipped()
                            .overlay(
                                Text(roomName)
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(),
                                alignment: .bottomLeading
                            )
                            .offset(y: yOffset > 0 ? -yOffset : 0)
                    }
                    .frame(height: 250)
                    
                    // Devices title
                    Text("Devices")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.horizontal)
                        .padding(.top, 10)
                    
                    // Device Cards
                    LazyVStack(spacing: 16) {
                        ForEach(viewModel.devices) { device in
                            NavigationLink(destination: viewModel.destinationView(for: device.type)) {
                                HStack {
                                    Image(systemName: viewModel.iconName(for: device.type))
                                        .font(.system(size: 28))
                                        .foregroundColor(device.isOn ? .yellow : .gray)
                                        .frame(width: 40)

                                    VStack(alignment: .leading) {
                                        Text(device.name)
                                            .font(.headline)
                                            .foregroundColor(.blue)
                                        Text(viewModel.statusText(for: device))
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                    }

                                    Spacer()

                                    Toggle("", isOn: Binding(
                                        get: { device.isOn },
                                        set: { _ in
                                            viewModel.toggleDevice(device)
                                        }
                                    ))
                                    .labelsHidden()
                                    .tint(.yellow)
                                }
                                .padding()
                                .background(Color(.systemGray6))
                                .cornerRadius(12)
                                .padding(.horizontal)
                            }
                        }
                    }
                    .padding(.top)
                }
            }
            .edgesIgnoringSafeArea(.top)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}



struct RoomDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RoomDetailView(
                roomName: "Living Room",
                roomImageName: "livingRoomImage" // Assets.xcassets içinde tanımlı olmalı
            )
        }
    }
}

