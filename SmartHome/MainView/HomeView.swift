//
//  HomeView.swift
//  SmartHome
//
//  Created by Emre on 20.03.2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    @State private var selectedTab: String = "Room"
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    LocationView()
                        .frame(height: 120)
                        .padding(.horizontal)
                HStack(spacing: 0) {
                    ForEach(["Room", "Devices"], id: \.self) { tab in
                        Button(action: {
                            selectedTab = tab
                        }) {
                            Text(tab)
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(selectedTab == tab ? Color.purple.opacity(0.15) : Color.clear)
                                .cornerRadius(10)
                        }
                    }
            }
                    .background(Color(.systemGray5))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal)
                    
                    if selectedTab == "Room" {
                    RoomsView(viewModel: viewModel)
                    .padding(.horizontal)
                    } else {
                    DevicesGridView(viewModel: viewModel)
                    .padding(.horizontal)
                    }
                }
            }
            .navigationTitle("Smart Home")
        }
    }
}
#Preview {
    MainView()
}
