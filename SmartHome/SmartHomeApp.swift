//
//  SmartHomeApp.swift
//  SmartHome
//
//  Created by Emre on 20.03.2025.
//

import SwiftUI

@main
struct SmartHomeApp: App {
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = true
    @AppStorage("isProfileSelected") var isProfileSelected: Bool = false
    @State private var showWelcome = true

    init() {
        UserDefaults.standard.set(false, forKey: "isProfileSelected")
    }

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                if showWelcome {
                    WelcomeView {
                        showWelcome = false
                    }
                } else {
                    if !isLoggedIn {
                        LoginView()
                    } else if !isProfileSelected {
                        ProfileSelectionView()
                    } else {
                        MainView()
                    }
                }
            }
        }
    }
}
