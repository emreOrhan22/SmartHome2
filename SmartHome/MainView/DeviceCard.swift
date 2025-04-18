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
                Image(systemName: device.isOn ? "lightbulb.fill" : "lightbulb")
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
                    }
                ))
                .labelsHidden()
            }
            .padding()
            .frame(width: 150, height: 180)
            .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
            .shadow(radius: 5)
            .onTapGesture {
                if device.isOn && (isThermalDevice(device.name) || isLightDevice(device.name)) {
                    navigate = true
                }
            }
        }
    }

    func isThermalDevice(_ name: String) -> Bool {
        let lowercased = name.lowercased()
        return lowercased.contains("air") || lowercased.contains("heat") || lowercased.contains("thermo")
    }

    func isLightDevice(_ name: String) -> Bool {
        let lowercased = name.lowercased()
        return lowercased.contains("light") || lowercased.contains("lamp")
    }

    @ViewBuilder
    func destinationView() -> some View {
        if isThermalDevice(device.name) {
            ThermostatView()
        } else if isLightDevice(device.name) {
            LightDetailView()
        } else {
            Text("No view assigned")
        }
    }
}

#Preview {
    DevicesGridView(viewModel: HomeViewModel())
}
