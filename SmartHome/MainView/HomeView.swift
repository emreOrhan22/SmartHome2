//
//  HomeView.swift
//  SmartHome
//
//  Created by Emre on 20.03.2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    @State private var selectedTab: String = "Rooms"

    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    headerSection
                    LocationView()
                        .frame(height: 120)
                        .padding(.horizontal)

                    tabButtonSection
                    roomCardsView()
                }
                .padding(.top)
            }
            .navigationTitle("Smart Home")
        }
        .task {
            await viewModel.fetchDeviceLogs()
        }
    }

    // MARK: - Header
    private var headerSection: some View {
        HStack {
            Text("Family Members")
                .font(.subheadline)
                .fontWeight(.semibold)

            Spacer()

            HStack(spacing: -10) {
                InitialAvatarView(name: "Test Test")
                InitialAvatarView(name: "Emre Orhan")
            }
        }
        .padding(.horizontal)
        .padding(.bottom, 4)
    }

    // MARK: - Tab Button
    private var tabButtonSection: some View {
        HStack(spacing: 0) {
            Button(action: {
                selectedTab = "Rooms"
            }) {
                Text("Rooms")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(selectedTab == "Rooms" ? Color.purple.opacity(0.15) : Color.clear)
                    .cornerRadius(10)
            }
        }
        .background(Color(.systemGray5))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(.horizontal)
    }

    // MARK: - Room Cards
    private func roomCardsView() -> some View {
        if viewModel.isLoading {
            return AnyView(
                ProgressView("Loading...")
                    .padding()
            )
        } else if let error = viewModel.errorMessage {
            return AnyView(
                Text(error)
                    .foregroundColor(.red)
                    .padding()
            )
        } else {
            let groupedRooms = viewModel.groupedLogsByRoom.sorted { $0.key < $1.key }

            return AnyView(
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(groupedRooms, id: \.key) { (area, logs) in
                        let uniqueDeviceCount = Set(logs.map { $0.deviceid }).count

                        NavigationLink(destination: RoomDetailView(areaName: area, devices: logs)) {
                            RoomCard(
                                areaName: area,
                                iconName: iconName(for: area),
                                deviceCount: logs.count
                            )
                        }
                    }
                }
                .padding(.horizontal)
            )
        }
    }



    // MARK: - Icon Matching
    private func iconName(for area: String) -> String {
        switch area.lowercased() {
        case "kitchen": return "kitchenImage"
        case "living_room": return "livingRoomImage"
        case "bedroom": return "bedroomImage"
        case "bathroom": return "bathroomImage"
        default: return "defaultRoomImage"
        }
    }
}

#Preview {
    MainView()
}

