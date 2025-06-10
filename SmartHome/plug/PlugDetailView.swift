//
//  PlugDetailView.swift
//  SmartHome
//
//  Created by Emre on 6.05.2025.
//

import SwiftUI

struct PlugDetailView: View {
    @State private var isOn: Bool = false

    var body: some View {
        VStack(spacing: 30) {
            Text("Smart Plug")
                .font(.title)
                .bold()

            Image("plug")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .opacity(isOn ? 1 : 0.3)

            Button(action: {
                isOn.toggle()
            }) {
                Text(isOn ? "Turn Off" : "Turn On")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(isOn ? Color.red : Color.green)
                    .cornerRadius(20)
            }
            .padding(.horizontal)

            VStack(spacing: 20) {
                HStack {
                    Image(systemName: "clock")
                        .foregroundColor(.gray)
                    Text("Scheduled to turn off in 30 min")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                HStack {
                    Image(systemName: "bolt")
                        .foregroundColor(.gray)
                    Text("Energy used today: 0.5 kWh")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(15)

            Spacer()
        }
        .padding()
        .background(Color.white.ignoresSafeArea())
        .navigationTitle("Plug Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    PlugDetailView()
}
