//
//  LightDetailView.swift
//  SmartHome
//
//  Created by Emre on 15.04.2025.
//


import SwiftUI

struct LightDetailView: View {
    @StateObject var viewModel = LightDetailViewModel()
    var lampImage: String = "Lamp"

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
                .opacity(viewModel.getLampOpacity())
                .shadow(color: viewModel.getGlowColor().opacity(viewModel.getGlowStrength()), radius: 40)

            Button(action: { viewModel.toggleLamp() }) {
                Text(viewModel.isLampOn ? "Turn Off" : "Turn On")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(viewModel.isLampOn ? Color.red : Color.green)
                    .cornerRadius(12)
            }
            .padding(.horizontal)

            VStack(spacing: 15) {
                Text("Brightness Level: \(viewModel.brightnessLevel)")
                    .font(.subheadline)

                Slider(value: Binding(get: { Double(viewModel.brightnessLevel) },
                                      set: { viewModel.brightnessLevel = Int($0.rounded()) }),
                       in: 0...100, step: 1)
                    .accentColor(.yellow)
            }
            .padding(.horizontal)

            Text(viewModel.brightnessDescription())
                .font(.caption)
                .foregroundColor(.gray)

            Spacer()
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.white.ignoresSafeArea())
    }
}

#Preview {
    LightDetailView()
}
