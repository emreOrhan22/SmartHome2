//
//  DeviceCard.swift
//  SmartHome
//
//  Created by Emre on 22.03.2025.
//
import SwiftUI

struct DeviceCard: View {
    var device: Device
    @ObservedObject var viewModel: HomeViewModel
    @State private var navigate = false

    var body: some View {
        ZStack {
            NavigationLink(destination: destinationView(), isActive: $navigate) {
                EmptyView()
            }
            .hidden()

            HStack(spacing: 16) {
                // Renkli ikon kutusu
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(backgroundColor(for: device.type))
                        .frame(width: 50, height: 50)

                    deviceIcon(for: device.type, isOn: device.isOn)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.white)
                }

                VStack(alignment: .leading, spacing: 4) {
                    Text(device.name)
                        .font(.headline)
                        .foregroundColor(.black)

                    Text(viewModel.statusText(for: device))
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }

                Spacer()

                Toggle("", isOn: Binding(
                    get: { device.isOn },
                    set: { _ in
                        viewModel.toggleDevice(device)
                    })
                )
                .labelsHidden()
            }
            .padding()
            .background(Color.white)
            .cornerRadius(16)
            .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 3)
            .onTapGesture {
                if device.isOn {
                    navigate = true
                }
            }
        }
    }

    // Navigasyon
    func destinationView() -> some View {
        switch device.type {
        case .airConditioner:
            return AnyView(NavigationWrapperView(title: "Air Conditioner") {
                AirConditionerDetailView()
            })
        case .thermostat:
            return AnyView(NavigationWrapperView(title: "Thermostat") {
                ThermostatView()
            })
        case .light:
            return AnyView(NavigationWrapperView(title: "Light Details") {
                LightDetailView()
            })
        case .curtain:
            return AnyView(NavigationWrapperView(title: "Curtain") {
                CurtainDetailView()
            })
        case .plug:
            return AnyView(NavigationWrapperView(title: "Smart Plug") {
                PlugDetailView()
            })
        }
    }

    // İkonlar
    private func deviceIcon(for type: DeviceType, isOn: Bool) -> Image {
        switch type {
        case .light:
            return Image(systemName: isOn ? "lightbulb.fill" : "lightbulb")
        case .airConditioner:
            return Image(systemName: isOn ? "wind" : "wind")
        case .thermostat:
            return Image(systemName: isOn ? "thermometer" : "thermometer")
        case .curtain:
            return Image(systemName: isOn ? "window.vertical.open" : "window.vertical.closed")
        case .plug:
            return Image(systemName: isOn ? "powerplug.fill" : "powerplug")
        }
    }

    // Arka plan rengi
    private func backgroundColor(for type: DeviceType) -> Color {
        switch type {
        case .light: return Color.yellow.opacity(0.8)
        case .airConditioner: return Color.blue.opacity(0.7)
        case .thermostat: return Color.orange.opacity(0.7)
        case .curtain: return Color.purple.opacity(0.7)
        case .plug: return Color.green.opacity(0.7)
        }
    }
}


#Preview {
    DevicesGridView(viewModel: HomeViewModel())
}
