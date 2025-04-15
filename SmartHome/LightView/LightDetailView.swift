//
//  LightDetailView.swift
//  SmartHome
//
//  Created by Emre on 15.04.2025.
//

import SwiftUI

struct LightDetailView: View {
    @State private var brightness: Double = 100
    @State private var lastBrightness: Double = 100

    var lampImage: String = "Lamp"
    var isOn: Bool {
        brightness > 0
    }

    var body: some View {
        VStack(spacing: 30) {
            Text("Light")
                .font(.title)
                .bold()

            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color.yellow.opacity(getBeamOpacity()), .clear]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .frame(width: 140, height: 250)
                .blur(radius: 25)
                .offset(y: 100)
                .opacity(isOn ? 1 : 0)
                .animation(.easeInOut(duration: 0.3), value: brightness)

                Image(lampImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 160)
                    .opacity(isOn ? 1.0 : 0.3)
                    .animation(.easeInOut(duration: 0.3), value: brightness)
            }

            Button(action: {
                withAnimation(.easeInOut(duration: 0.3)) {
                    if isOn {
                        lastBrightness = brightness
                        brightness = 0
                    } else {
                        brightness = lastBrightness == 0 ? 50 : lastBrightness
                    }
                }
            }) {
                Text(isOn ? "Turn Off" : "Turn On")
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.yellow.opacity(0.3))
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black.opacity(isOn ? 0 : 0.3), lineWidth: isOn ? 0 : 1)
                    )
            }
            .padding(.horizontal)

            VStack(spacing: 10) {
                Text("Brightness")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)

                HStack {
                    Image(systemName: "sun.min.fill")
                    Slider(value: $brightness, in: 0...100)
                        .accentColor(.yellow)
                        .onChange(of: brightness) { _ in
                            withAnimation(.easeInOut(duration: 0.2)) { }
                        }
                    Image(systemName: "sun.max.fill")
                }

                Text("\(Int(brightness))%")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(isOn ? .yellow : .gray)

                Text(brightnessDescription())
                    .foregroundColor(.gray)
                    .opacity(isOn ? 1 : 0.5)
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(20)
            .padding(.horizontal)

            HStack {
                Image(systemName: "clock")
                Text("Scheduled to turn off at 22:00")
                    .font(.footnote)
            }

            Spacer()
        }
        .padding()
        .background(Color.white.ignoresSafeArea())
    }

    func brightnessDescription() -> String {
        switch brightness {
        case 0: return "Off"
        case 1..<40: return "Low Brightness"
        case 40..<75: return "Medium Brightness"
        default: return "Full Brightness"
        }
    }

    func getBeamOpacity() -> Double {
        switch brightness {
        case 0: return 0.0
        case 1..<40: return 0.3
        case 40..<75: return 0.6
        default: return 1.0
        }
    }
}

#Preview {
    LightDetailView()
}
