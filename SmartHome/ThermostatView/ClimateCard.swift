//
//  ClimateCard.swift
//  SmartHome
//
//  Created by Emre on 28.03.2025.
//

import SwiftUI

struct ClimateCard: View {
    var iconName: String
    var index: String
    var measure: String
    
    var body: some View {
        ZStack{
            // Card
            RoundedRectangle(cornerRadius: 22, style: .continuous)
                .fill(Color("Card Background"))
                .shadow(color: Color("Card Shadow") , radius: 40 , x: 0 , y: 20 )
                .overlay{
                    RoundedRectangle(cornerRadius: 22, style: .continuous)
                        .stroke(.white.opacity(0.5),lineWidth: 1)
                }
            VStack(spacing:10) {
                // Circle İcon
                Image(systemName: iconName)
                    .font(.title2.weight(.semibold))
                    .foregroundColor(.white)
                    .frame(width: 60, height: 60)
                    .background(LinearGradient([Color("Temperature Ring 1"),Color("Temperature Ring 2")] , startPoint: .top , endPoint: .bottom))
                    .clipShape(.circle)
                
                VStack(spacing:8) {
                    // Index
                    Text(index)
                        .font(.headline)
                        .foregroundColor(.black)
                    
                    //Measure
                    Text(measure)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .opacity(0.6)
                }
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 10)
            
        }
        .frame(width: 144, height: 164)
    }
    
    struct ClimateCard_Previews: PreviewProvider {
        static var previews: some View {
            ClimateCard(iconName: "humidity.fill", index: "Inside Humidity", measure:"50%")
                .frame(maxWidth: .infinity , maxHeight: .infinity)
                .background(Color("Background"))
        }
    }
}
