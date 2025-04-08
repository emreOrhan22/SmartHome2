//
//  LocationView.swift
//  SmartHome
//
//  Created by Emre on 21.03.2025.
//
import SwiftUI

struct LocationView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("My Location")
                .font(.headline)
                .foregroundColor(.white)
            Text("New York")
                .font(.title2)
                .bold()
                .foregroundColor(.white)
            Text("Partly Cloudy, 10°C")
                .foregroundColor(.white.opacity(0.8))
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 120)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
        )
    }
}

#Preview {
    MainView()
}
