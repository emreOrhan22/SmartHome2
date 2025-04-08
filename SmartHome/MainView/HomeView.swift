//
//  HomeView.swift
//  SmartHome
//
//  Created by Emre on 20.03.2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    LocationView()
                        .frame(height: 120)
                        .padding(.horizontal)
                    RoomsView(viewModel: viewModel)
                        .padding(.horizontal)
                    DevicesGridView(viewModel: viewModel)
                        .padding(.horizontal)
                }
            }
            .navigationTitle("Smart Home")
        }
    }
}
#Preview {
    MainView()
}
