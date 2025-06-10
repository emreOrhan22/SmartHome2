//
//  WelcomeView.swift
//  SmartHome
//
//  Created by Emre on 24.04.2025.
//
import SwiftUI

struct WelcomeView: View {
    var onFinish: () -> Void

    var body: some View {
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
            .transition(.opacity)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation {
                    onFinish()
                }
            }
        }
    }
}



