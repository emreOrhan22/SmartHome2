//
//  AddRoomSheetView.swift
//  SmartHome
//
//  Created by Emre on 10.04.2025.
//

import SwiftUI

struct AddRoomSheetView: View {
    @ObservedObject var viewModel: HomeViewModel
    @Binding var isPresented: Bool
    
    @State private var roomName: String = ""
    @State private var selectedType: String = "Kitchen"
    @State private var selectedIcon: String = "kitchen_icon" 

    let roomTypes = ["Kitchen", "Living Room", "Bedroom", "Bathroom", "Balcony"]
    let icons = ["kitchen_icon", "living_icon", "bed_icon", "bath_icon", "balcony_icon"]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Room Name")) {
                    TextField("Enter room name", text: $roomName)
                }

                Section(header: Text("Room Type")) {
                    Picker("Select Room Type", selection: $selectedType) {
                        ForEach(roomTypes, id: \.self) { type in
                            Text(type)
                        }
                    }
                    .pickerStyle(.menu)
                }

                Section(header: Text("Icon")) {
                    Picker("Select Icon", selection: $selectedIcon) {
                        ForEach(icons, id: \.self) { icon in
                            HStack {
                                Image(icon)
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                Text(icon)
                            }
                        }
                    }
                    .pickerStyle(.menu)
                }
            }
            .navigationTitle("Add Room")
            .navigationBarItems(
                leading: Button("Cancel") {
                    isPresented = false
                },
                trailing: Button("Save") {
                    viewModel.addRoom(name: roomName, type: selectedType, icon: selectedIcon)
                    isPresented = false
                }
                .disabled(roomName.isEmpty)
            )
        }
    }
}


#Preview {
    AddRoomSheetView(viewModel: HomeViewModel(), isPresented: .constant(false))
}

