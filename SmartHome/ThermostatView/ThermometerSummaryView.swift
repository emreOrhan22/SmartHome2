//
//  ThermometerSummaryView.swift
//  SmartHome
//
//  Created by Emre on 2.04.2025.
//

import SwiftUI

struct ThermometerSummaryView: View {
    var status : Status
    var showStatus : Bool
    var temperature : CGFloat
    
    var body: some View {
        VStack(spacing: 0) {
            //Temperature Status
            Text(status.rawValue)
                .font(.headline)
                .foregroundColor(.black)
                .opacity(showStatus ? 0.6 : 0)
                .animation(.easeIn(duration: 0.5), value: showStatus)
            
            // Temperature
            Text("\(temperature , specifier: "%.0f")")
                .font(.system(size: 54))
                .foregroundColor(Color("Temperature Label"))
                .shadow(color: Color("Temperature Label Shadow"), radius: 1.5, x: 0, y: 1.5)
            
            //Eco
            Image(systemName: "leaf")
                .font(.title2.bold())
                .foregroundColor(.green)
            
            
        }
        .padding(.top , 40)
    }
}

#Preview {
    ThermometerSummaryView(status: .heating, showStatus: true, temperature: 22)
        .background(Color("Inner Dial 2"))
}
