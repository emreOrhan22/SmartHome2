//
//  WelcomeView.swift
//  SmartHome
//
//  Created by Emre on 24.04.2025.
//
import SwiftUI

struct WelcomeView: View {
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    @AppStorage("isProfileSelected") var isProfileSelected: Bool = false

    @State private var navigateTo: Destination?

    enum Destination {
        case login, profileSelection, main
    }

    var body: some View {
        Group {
            if let destination = navigateTo {
                switch destination {
                case .login:
                    LoginView()
                case .profileSelection:
                    ProfileSelectionView()
                case .main:
                    MainView()
                }
            } else {
                ZStack {
                    Color.white.ignoresSafeArea()
                    VStack(spacing: 20) {
                        LinearGradient(
                            gradient: Gradient(colors: [Color.purple, Color.pink, Color.orange]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                        .mask(
                            Text("Welcome")
                                .font(.system(size: 48, weight: .bold))
                        )
                        .frame(height: 60)
                    }
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                if !isLoggedIn {
                    navigateTo = .login
                } else if !isProfileSelected {
                    navigateTo = .profileSelection
                } else {
                    navigateTo = .main
                }
            }
        }
    }
}






