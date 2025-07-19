//
//  RoomDetailView.swift
//  SmartHome
//
//  Created by Emre on 13.05.2025.
//

import SwiftUI

struct RoomDetailView: View {
    var areaName: String
    var devices: [DeviceLog]

    @State private var expandedType: String? = nil

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(spacing: 0) {

                    //  ÜSTTEKİ GÖRSEL + BAŞLIK
                    GeometryReader { geo in
                        let yOffset = geo.frame(in: .global).minY

                        Image(iconName(for: areaName))
                            .resizable()
                            .scaledToFill()
                            .frame(width: geometry.size.width,
                                   height: yOffset > 0 ? 250 + yOffset : 250)
                            .clipped()
                            .overlay(
                                Text(areaName.capitalized)
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(),
                                alignment: .bottomLeading
                            )
                            .offset(y: yOffset > 0 ? -yOffset : 0)
                    }
                    .frame(height: 250)

                    //  BAŞLIK
                    Text("Devices")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.horizontal)
                        .padding(.top)

                    //  CİHAZ GRUPLAMA
                    let groupedDevices = Dictionary(grouping: devices, by: { $0.type })

                    ForEach(groupedDevices.sorted(by: { $0.key < $1.key }), id: \.key) { type, logs in
                        VStack(alignment: .leading, spacing: 0) {

                            //  Üst Başlık (Expandable buton gibi)
                            HStack {
                                Image(systemName: deviceIcon(for: type))
                                    .foregroundColor(.blue)

                                Text(type)
                                    .font(.headline)
                                    .foregroundColor(.blue)

                                Spacer()

                                Image(systemName: expandedType == type ? "chevron.up" : "chevron.down")
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(12, corners: expandedType == type ? [.topLeft, .topRight] : .allCorners)
                            .padding(.horizontal)
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 0.25)) {
                                    expandedType = expandedType == type ? nil : type
                                }
                            }

                            //  İçerik: Cihaz detayları (sadece açıksa)
                            if expandedType == type {
                                VStack(spacing: 0) {
                                    ForEach(logs, id: \.deviceid) { device in
                                        Divider()

                                        HStack {
                                            Image(systemName: deviceIcon(for: device.type))
                                                .font(.system(size: 28))
                                                .foregroundColor(device.state == "on" ? .yellow : .gray)
                                                .frame(width: 40)

                                            VStack(alignment: .leading, spacing: 4) {
                                                Text(device.type)
                                                    .font(.subheadline)
                                                    .foregroundColor(.blue)

                                                Text(deviceDescription(for: device))
                                                    .font(.caption)
                                                    .foregroundColor(.gray)
                                            }

                                            Spacer()

                                            Toggle("", isOn: .constant(device.state == "on"))
                                                .labelsHidden()
                                                .tint(.yellow)
                                        }
                                        .padding(.horizontal)
                                        .padding(.vertical, 10)
                                    }
                                }
                                .background(Color(.systemGray6))
                                .cornerRadius(12, corners: [.bottomLeft, .bottomRight])
                                .padding(.horizontal)
                                .transition(.opacity.combined(with: .move(edge: .top)))
                            }

                        }
                        .padding(.bottom, 10)
                    }
                }
            }
            .edgesIgnoringSafeArea(.top)
        }
        .navigationBarTitleDisplayMode(.inline)
    }

    //  İKON EŞLEŞMESİ
    func deviceIcon(for type: String) -> String {
        switch type.lowercased() {
        case "smart light": return "lightbulb.fill"
        case "air conditioner": return "wind"
        case "thermostat": return "thermometer"
        case "smart curtain": return "window.vertical.closed"
        case "smart plug": return "powerplug"
        default: return "questionmark"
        }
    }

    //  ALT AÇIKLAMA
    func deviceDescription(for device: DeviceLog) -> String {
        switch device.type.lowercased() {
        case "smart light":
            return "Brightness: \(device.value)%"
        case "air conditioner":
            return "Temperature: \(device.value)°C"
        case "smart curtain":
            return device.state == "on" ? "OPEN" : "CLOSED"
        case "smart plug", "thermostat":
            return device.state.uppercased()
        default:
            return "Value: \(device.value)"
        }
    }

    //  GÖRSEL EŞLEŞMESİ
    func iconName(for area: String) -> String {
        switch area.lowercased() {
        case "kitchen": return "kitchenImage"
        case "living_room": return "livingRoomImage"
        case "bedroom": return "bedroomImage"
        case "bathroom": return "bathroomImage"
        default: return "defaultRoomImage"
        }
    }
}



#Preview {
    RoomDetailView(
        areaName: "kitchen",
        devices: [
            DeviceLog(area: "kitchen", date: "2025-06-20", deviceid: "1", level: "ok", state: "on", type: "Smart Light", value: "24"),
            DeviceLog(area: "kitchen", date: "2025-06-20", deviceid: "2", level: "ok", state: "off", type: "Smart Plug", value: "0")
        ]
    )
}
