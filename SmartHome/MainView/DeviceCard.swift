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

    var body: some View {
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
                set: { newValue in
                    viewModel.toggleDevice(device)
                }
            ))
            .labelsHidden()

            if device.isOn && isThermalDevice(device.name) {
                NavigationLink(destination: ThermostatView()) {
                    Text("Open Controls")
                        .font(.caption)
                        .padding(6)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue.opacity(0.2))
                        .cornerRadius(8)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        .padding()
        .frame(width: 150, height: 180)
        .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
        .shadow(radius: 5)
    }

    func isThermalDevice(_ name: String) -> Bool {
        let lowercased = name.lowercased()
        return lowercased.contains("air") || lowercased.contains("heat") || lowercased.contains("thermo")
    }
}


#Preview {
    DevicesGridView(viewModel: HomeViewModel())
}
