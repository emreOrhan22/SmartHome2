//
//  MainView.swift
//  SmartHome
//
//  Created by Emre on 20.03.2025.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            HomeView()
                .tabItem{
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            AccountView()
                .tabItem{
                    Image(systemName: "person.fill")
                    Text("Account")
                }
        }
    }
}

#Preview {
    MainView()
}
