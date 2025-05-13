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

            VStack(spacing: 10) {
                deviceIcon(for: device.type, isOn: device.isOn)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(device.isOn ? .yellow : .gray)

                Text(device.name)
                    .font(.headline)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)

                Toggle("", isOn: Binding(
                    get: { device.isOn },
                    set: { _ in
                        viewModel.toggleDevice(device)
                    })
                )
                .labelsHidden()
            }
            .padding()
            .frame(width: 150, height: 180)
            .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
            .shadow(radius: 5)
            .onTapGesture {
                if device.isOn {
                    navigate = true
                }
            }
        }
    }

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
}

#Preview {
    DevicesGridView(viewModel: HomeViewModel())
}
