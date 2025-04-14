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

    let roomTypes = ["Kitchen", "Living Room", "Bedroom", "Bathroom", "Balcony"]
    
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
            }
            .navigationTitle("Add Room")
            .navigationBarItems(
                leading: Button("Cancel") {
                    isPresented = false
                },
                trailing: Button("Save") {
                    let icon = getIconName(for: selectedType)
                    viewModel.addRoom(name: roomName, type: selectedType, iconName: icon)
                    isPresented = false
                }
                .disabled(roomName.isEmpty)
            )
        }
    }

    func getIconName(for roomType: String) -> String {
        switch roomType.lowercased() {
        case "kitchen": return "kitchenImage"
        case "living room": return "livingRoomImage"
        case "bathroom": return "bathroomImage"
        case "bedroom": return "bedroomImage"
        case "balcony": return "balconyImage"
        default: return "defaultRoomImage"
        }
    }
}


#Preview {
    AddRoomSheetView(viewModel: HomeViewModel(), isPresented: .constant(false))
}

