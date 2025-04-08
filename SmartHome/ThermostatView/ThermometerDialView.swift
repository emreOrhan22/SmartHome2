//
//  ThermometerDialView.swift
//  SmartHome
//
//  Created by Emre on 28.03.2025.
//

import SwiftUI

struct ThermometerDialView: View {
    private let outerDialSize: CGFloat = 200
    private let innerDialSize: CGFloat = 172
    private let setPointSize: CGFloat = 15
    var degrees: CGFloat = 0
    
    var body: some View {
        ZStack {
            //Outer Dial
            Circle()
                .fill(LinearGradient([Color("Outer Dial 1"),Color("Outer Dial 2")]))
                .frame(width: outerDialSize, height: outerDialSize)
                .shadow(color: .black.opacity(0.25), radius: 60, x: 0, y: 31) //Drop Shadow 1
                .shadow(color: Color("Dial Drop Shadow 2"), radius: 15, x: 0, y: 8) //Drop Shadow 2
                .overlay {
                    //Outer Dial Border
                    Circle()
                        .stroke(LinearGradient([Color("Outer Dial Border 1"),Color("Outer Dial Border 1")]), lineWidth: 1)
                }
                .overlay {
                    //Outer Dial Inner Shadow
                    Circle()
                        .stroke(.white.opacity(0.5), lineWidth: 4)
                        .blur(radius: 8)
                        .offset(x: 3, y: 3)
                        .mask {
                            Circle()
                                .fill(LinearGradient([.white, .clear]))
                        }
                }
            // Inner Dial
            Circle()
                .fill(LinearGradient([Color("Inner Dial 1"),Color("Inner Dial 2")]))
                .frame(width: innerDialSize, height: innerDialSize)
            
            // Setpoint
            Circle()
                .fill(LinearGradient([Color("Temperature Set Point 1"),Color("Temperature Set Point 2")]))
                .frame(width: setPointSize, height: setPointSize)
                .frame(width: innerDialSize, height: innerDialSize, alignment: .top)
                .offset(x: 0 , y:7.5)
                .rotationEffect(.degrees(degrees + 180))
                .animation(.easeInOut(duration: 1), value: degrees)
                                
            
            
        }
    }
}

#Preview {
    ThermometerDialView()
        .frame(maxWidth: .infinity , maxHeight: .infinity)
        .background(Color("Background"))
}
