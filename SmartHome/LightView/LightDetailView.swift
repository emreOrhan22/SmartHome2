//
//  LightDetailView.swift
//  SmartHome
//
//  Created by Emre on 15.04.2025.
//

import SwiftUI

struct LightDetailView: View {
    @State private var brightnessLevel: Int = 0 // 0 = Kapalı, 3 = En parlak
    
    var lampImage: String = "Lamp" // gönderdiğin görselin ismi (Lamp.png)

    var body: some View {
        VStack(spacing: 30) {
            Text("Light")
                .font(.title)
                .bold()
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.top, 10)

            Image(lampImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .opacity(getLampOpacity())
                .shadow(color: getGlowColor().opacity(getGlowStrength()), radius: 40)

            VStack(spacing: 20) {
                Text("Brightness")
                    .font(.headline)
                
                HStack(spacing: 20) {
                    ForEach(0..<4) { index in
                        Circle()
                            .fill(index == 0 ? Color.gray : Color.yellow)
                            .frame(width: 30, height: 30)
                            .opacity(index == brightnessLevel ? 1.0 : 0.3)
                            .overlay(
                                Circle()
                                    .stroke(Color.black, lineWidth: index == brightnessLevel ? 2 : 0)
                            )
                            .onTapGesture {
                                brightnessLevel = index
                            }
                    }
                }
                
                Text(brightnessDescription())
                    .font(.caption)
                    .foregroundColor(.gray)
            }

            Spacer()
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.white.ignoresSafeArea())
    }

    // MARK: - Helper Functions

    func getLampOpacity() -> Double {
        switch brightnessLevel {
        case 0: return 0.2
        case 1: return 0.5
        case 2: return 0.75
        case 3: return 1.0
        default: return 1.0
        }
    }

    func getGlowColor() -> Color {
        return Color.yellow
    }

    func getGlowStrength() -> Double {
        switch brightnessLevel {
        case 0: return 0.0
        case 1: return 0.3
        case 2: return 0.6
        case 3: return 1.0
        default: return 0.0
        }
    }

    func brightnessDescription() -> String {
        switch brightnessLevel {
        case 0: return "Off"
        case 1: return "Low Brightness"
        case 2: return "Medium Brightness"
        case 3: return "Full Brightness"
        default: return ""
        }
    }
}

#Preview {
    LightDetailView()
}
