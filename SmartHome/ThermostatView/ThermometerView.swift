//
//  ThermometerView.swift
//  SmartHome
//
//  Created by Emre on 28.03.2025.
//

import SwiftUI

enum Status: String {
    case heating = "HEATING"
    case cooling = "COOLING"
    case reaching = "REACHING"
}

struct ThermometerView: View {
    private let ringSize: CGFloat = 220
    private let outerDialSize: CGFloat = 200
    private let minTemperature: CGFloat = 4
    private let maxTemperature: CGFloat = 30
    
    @State private var currentTemperature: CGFloat = 0
    @State private var degrees: CGFloat = 36
    @State private var showStatus = false
    
    var targetTemperature: CGFloat {
        return min(max(degrees / 360 * 40, minTemperature),maxTemperature)
    }
    
    var ringValue: CGFloat {
        return currentTemperature / 40
    }
    
    var status: Status {
        if currentTemperature < targetTemperature {
            return .heating
        }else if currentTemperature > targetTemperature {
            return .cooling
        }else {
            return .reaching
        }
    }
    
    let timer = Timer
        .publish(every: 1, on: .main, in: .common)
        .autoconnect()
    
    var body: some View {
        ZStack{
            // Thermometer Scale
            ThermometerScaleView()
            //PlaceHolder
            ThermometerPlaceholderView()
            
            // Temperature Ring
            Circle()
                .inset(by: 5)
                .trim(from: 0.099, to: min (ringValue, 0.75))
                .stroke(LinearGradient([Color("Temperature Ring 1"),Color("Temperature Ring 2")]), style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                .frame(width: ringSize, height: ringSize)
                .rotationEffect(.degrees(90))
                .animation(.linear(duration: 1), value: ringSize)
            
            //Thermometer Dial
            ThermometerDialView(degrees: degrees)
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            let x = min(max(value.location.x, 0), outerDialSize)
                            let y = min(max(value.location.y, 0), outerDialSize)
                            
                            let endPoint = CGPoint(x: x, y: y)
                            let centerPoint = CGPoint(x: outerDialSize / 2, y: outerDialSize / 2)
                            
                            let angle = calculateAngle(centerPoint: centerPoint, endPoint: endPoint)
                            
                            if angle < 36 || angle > 270 {return}
                            
                            degrees = angle - angle.remainder(dividingBy: 9)
                        })
                )
            
            //Thermometer Summary
            ThermometerSummaryView(status: status, showStatus: showStatus, temperature: currentTemperature)
            
        }
        .onAppear {
            currentTemperature = 22
            degrees = currentTemperature / 40 * 360
        }
        .onReceive(timer) { _ in
            switch status {
            case .heating:
                showStatus = true
                currentTemperature += 1
            case .cooling:
                showStatus = true
                currentTemperature -= 1
            case .reaching:
                showStatus = false
                break
            }
        }
        .onDisappear{
            timer.upstream.connect().cancel()
        }
    }
}

#Preview {
    ThermometerView()
        .frame(maxWidth: .infinity , maxHeight: .infinity)
        .background(Color("Background"))
}

extension ThermometerView {
    private func calculateAngle(centerPoint: CGPoint , endPoint: CGPoint) -> CGFloat {
        let radians = atan2(endPoint.x - centerPoint.x, centerPoint.y - endPoint.y)
        let degrees = 180 + (radians * 180 / .pi)
        
        return degrees
    }
}
