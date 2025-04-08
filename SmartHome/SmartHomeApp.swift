//
//  SmartHomeApp.swift
//  SmartHome
//
//  Created by Emre on 20.03.2025.
//

import SwiftUI

@main
struct SmartHomeApp: App {
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false

    var body: some Scene {
        WindowGroup {
            NavigationView {
                if isLoggedIn {
                    MainView()
                } else {
                    LoginView()
                }
            }
        }
    }
}



