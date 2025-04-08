//
//  ThermometerPlaceholderView.swift
//  SmartHome
//
//  Created by Emre on 28.03.2025.
//

import SwiftUI

struct ThermometerPlaceholderView: View {
    private let placeholderSize: CGFloat = 244
    
    var body: some View {
        Circle()
            .fill(LinearGradient([Color("Placeholder 1"), Color("Placeholder 2")]))
            .frame(width: placeholderSize ,height: placeholderSize)
            .shadow(color: Color("Placeholder Drop Shadow"), radius: 30, x: 0, y: 15) //Drop Shadow
            .overlay{
                //Placeholder Border
                Circle()
                    .stroke(LinearGradient([.white.opacity(0.5) , Color("Placeholder Border 2")]), lineWidth: 0.8)
            }
            .overlay{
                //Placeholder Inner Shadow
                Circle()
                    .stroke(Color("Placeholder Inner Shadow"), lineWidth: 2)
                    .blur(radius: 8)
                    .offset(x: 0, y: 3)
                    .mask {
                        Circle()
                            .fill(LinearGradient([.white, .clear] , startPoint: .top , endPoint: .bottom))
                    }
            }
        
    }
}

struct ThermometerPlaceholderView_Previews: PreviewProvider {
    static var previews: some View {
        ThermometerView()
            .frame(maxWidth: .infinity , maxHeight: .infinity)
            .background(Color("Background"))
    }
}

