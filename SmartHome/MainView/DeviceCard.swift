//
//  DeviceCard.swift
//  SmartHome
//
//  Created by Emre on 22.03.2025.
//
import SwiftUI

struct DeviceCard: View {
    let log: DeviceLog

    var body: some View {
        HStack(spacing: 16) {
            // Renkli ikon kutusu
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(backgroundColor(for: log.type))
                    .frame(width: 50, height: 50)

                deviceIcon(for: log.type, isOn: log.state == "on")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.white)
            }

            VStack(alignment: .leading, spacing: 6) {
                Text(log.type)
                    .font(.headline)
                    .foregroundColor(.black)

                Text("Oda: \(log.area.capitalized)")
                    .font(.subheadline)
                    .foregroundColor(.gray)

                Text("Durum: \(log.state.capitalized) • Seviye: \(log.level.uppercased())")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            Spacer()

            Image(systemName: log.state == "on" ? "power.circle.fill" : "power.circle")
                .foregroundColor(log.state == "on" ? .green : .gray)
                .font(.system(size: 24))
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 2)
    }

    // İkon seçimi
    private func deviceIcon(for type: String, isOn: Bool) -> Image {
        switch type.lowercased() {
        case "light", "smart light":
            return Image(systemName: isOn ? "lightbulb.fill" : "lightbulb")
        case "air conditioner":
            return Image(systemName: "wind")
        case "thermostat":
            return Image(systemName: "thermometer")
        case "smart curtain", "curtain":
            return Image(systemName: isOn ? "window.vertical.open" : "window.vertical.closed")
        case "smart plug", "plug":
            return Image(systemName: isOn ? "powerplug.fill" : "powerplug")
        default:
            return Image(systemName: "questionmark.circle")
        }
    }

    // Renk seçimi
    private func backgroundColor(for type: String) -> Color {
        switch type.lowercased() {
        case "light", "smart light": return Color.yellow.opacity(0.8)
        case "air conditioner": return Color.blue.opacity(0.7)
        case "thermostat": return Color.orange.opacity(0.7)
        case "smart curtain", "curtain": return Color.purple.opacity(0.7)
        case "smart plug", "plug": return Color.green.opacity(0.7)
        default: return Color.gray.opacity(0.4)
        }
    }
}



#Preview {
    DevicesGridView(viewModel: HomeViewModel())
}
