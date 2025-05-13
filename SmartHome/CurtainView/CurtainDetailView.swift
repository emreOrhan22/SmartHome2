//
//  CurtainDetailView.swift
//  SmartHome
//
//  Created by Emre on 6.05.2025.
//

import SwiftUI

struct CurtainDetailView: View {
    @State private var openness: Double = 100
    @State private var lastOpenness: Double = 100

    var curtainImage: String = "curtain"

    var isOpen: Bool {
        openness > 0
    }

    var body: some View {
        VStack(spacing: 30) {
            Text("Living Room Curtain")
                .font(.title)
                .bold()

            Image(curtainImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180)

            Button(action: {
                withAnimation(.easeInOut(duration: 0.3)) {
                    if isOpen {
                        lastOpenness = openness
                        openness = 0
                    } else {
                        openness = lastOpenness == 0 ? 100 : lastOpenness
                    }
                }
            }) {
                Text(isOpen ? "Close Curtain" : "Open Curtain")
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.yellow.opacity(0.3))
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black.opacity(isOpen ? 0 : 0.3), lineWidth: isOpen ? 0 : 1)
                    )
            }
            .padding(.horizontal)

            VStack(spacing: 10) {
                Text("Openness")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)

                HStack {
                    Image(systemName: "sun.min.fill")
                    Slider(value: $openness, in: 0...100)
                        .accentColor(.yellow)
                        .onChange(of: openness) { _ in
                            withAnimation(.easeInOut(duration: 0.2)) { }
                        }
                    Image(systemName: "sun.max.fill")
                }

                Text("\(Int(openness))%")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.yellow)

                Text(opennessDescription())
                    .foregroundColor(.gray)
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(20)
            .padding(.horizontal)

            HStack {
                Image(systemName: "clock")
                Text("Scheduled to open at 08:00 AM")
                    .font(.footnote)
            }

            Spacer()
        }
        .navigationTitle("Curtain Details")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(false)
        .padding()
        .background(Color.white.ignoresSafeArea())
    }

    func opennessDescription() -> String {
        switch openness {
        case 0: return "Fully Closed"
        case 1..<40: return "Partially Closed"
        case 40..<75: return "Half Open"
        default: return "Fully Open"
        }
    }
}

#Preview {
    CurtainDetailView()
}

