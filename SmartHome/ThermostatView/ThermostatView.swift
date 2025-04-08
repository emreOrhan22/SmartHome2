//
//  ThermostatView.swift
//  SmartHome
//
//  Created by Emre on 28.03.2025.
//

import SwiftUI

struct ThermostatView: View {
    var body: some View {
        NavigationView{
            ZStack{
                Color("Background")
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 0){
                        //Thermometer
                        ThermometerView()
                            .padding(.top ,30)
                            .padding(.bottom , 60)
                        HStack(spacing: 20) {
                            //Humudity Card
                            ClimateCard(iconName: "humidity.fill", index: "Inside Humidity", measure: "49%")
                            
                            //Temperature Card
                            ClimateCard(iconName: "thermometer", index: "Outside Temp", measure: "23°C")
                        }
                    }
                }
            }
            .navigationTitle("Thermostat")
            .navigationBarTitleDisplayMode(.inline)
            .foregroundColor(.black)
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    ThermostatView()
        .preferredColorScheme(.light)
}
