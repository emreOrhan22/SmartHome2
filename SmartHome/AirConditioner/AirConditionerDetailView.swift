//
//  AirConditionerDetailView.swift
//  SmartHome
//
//  Created by Emre on 6.05.2025.
//

import SwiftUI

struct AirConditionerDetailView: View {
    @State private var temperature: Double = 24.0
    @State private var isOn: Bool = true
    @State private var selectedMode: String = "Cool"
    @State private var selectedFan: String = "Auto"
    @State private var isSwingOn: Bool = false

    let modes = ["Cool", "Heat", "Fan", "Auto"]
    let fanSpeeds = ["Low", "Mid", "High", "Auto"]

    var body: some View {
        VStack(spacing: 25) {
            Text("Air Conditioner")
                .font(.title)
                .bold()

            

            Text("\(String(format: "%.1f", temperature))°C")
                .font(.system(size: 64, weight: .semibold))
                .foregroundColor(.blue)

            HStack(spacing: 40) {
                Button(action: {
                    if temperature > 16.0 {
                        temperature -= 0.5
                    }
                }) {
                    Image(systemName: "chevron.down.circle.fill")
                        .font(.system(size: 48))
                        .foregroundColor(.blue)
                }

                Button(action: {
                    if temperature < 30.0 {
                        temperature += 0.5
                    }
                }) {
                    Image(systemName: "chevron.up.circle.fill")
                        .font(.system(size: 48))
                        .foregroundColor(.blue)
                }
            }

            VStack(alignment: .leading, spacing: 10) {
                Text("Mode")
                    .font(.headline)
                HStack {
                    ForEach(modes, id: \.self) { mode in
                        Button(action: {
                            selectedMode = mode
                        }) {
                            Text(mode)
                                .padding()
                                .frame(minWidth: 60)
                                .background(selectedMode == mode ? Color.blue.opacity(0.2) : Color.gray.opacity(0.1))
                                .cornerRadius(10)
                        }
                    }
                }

                Text("Fan Speed")
                    .font(.headline)
                HStack {
                    ForEach(fanSpeeds, id: \.self) { fan in
                        Button(action: {
                            selectedFan = fan
                        }) {
                            Text(fan)
                                .padding()
                                .frame(minWidth: 60)
                                .background(selectedFan == fan ? Color.orange.opacity(0.2) : Color.gray.opacity(0.1))
                                .cornerRadius(10)
                        }
                    }
                }

                Toggle(isOn: $isSwingOn) {
                    Text("Swing")
                        .font(.headline)
                }
                .padding(.top)
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(15)

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

            HStack {
                Image(systemName: "clock")
                Text("Scheduled to turn off at 23:00")
                    .font(.footnote)
            }

            Spacer()
        }
        .padding()
        .background(Color.white.ignoresSafeArea())
        .navigationTitle("AC Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    AirConditionerDetailView()
}
