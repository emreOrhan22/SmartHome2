//
//  LightDetailView.swift
//  SmartHome
//
//  Created by Emre on 15.04.2025.
//

import SwiftUI

struct LightDetailView: View {
    @State private var isOn: Bool = true
    @State private var brightness: Double = 0.5
    @State private var selectedColor: Color = .yellow
    
    let presetColors: [Color] = [.red, .orange, .yellow, .green, .blue, .purple, .pink, .white]

    var body: some View {
        VStack(spacing: 30) {
            Text("Light")
                .font(.title)
                .bold()
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.top, 10)
                .padding(.horizontal)
            Image("lightIcon")
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .foregroundColor(isOn ? selectedColor : .gray)
                .overlay(
                    Image("lightIcon")
                        .renderingMode(.template)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 150)
                        .foregroundColor(.black)
                        .opacity(0.2)
                )
            Button(action: {
                isOn.toggle()
            }) {
                Text(isOn ? "On" : "Off")
                    .foregroundColor(.black)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 30)
                    .background(Color(.systemGray5))
                    .cornerRadius(12)
            }
            VStack(alignment: .leading, spacing: 10) {
                Text("Brightness")
                    .font(.headline)
                
                HStack {
                    Image(systemName: "sun.min.fill")
                        .foregroundColor(.gray)
                    
                    Slider(value: $brightness, in: 0...1)
                        .accentColor(selectedColor) 
                    
                    Image(systemName: "sun.max.fill")
                        .foregroundColor(.gray)
                }

                Text("\(Int(brightness * 100))%")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            .padding(.horizontal)
            VStack(alignment: .leading, spacing: 10) {
                Text("Color")
                    .font(.headline)
                HStack(spacing: 12) {
                    ForEach(presetColors, id: \.self) { color in
                        Circle()
                            .fill(color)
                            .frame(width: 35, height: 35)
                            .overlay(
                                Circle()
                                    .stroke(Color.black, lineWidth: selectedColor == color ? 3 : 1)
                                    .scaleEffect(selectedColor == color ? 1.15 : 1.0)
                                    .animation(.easeInOut, value: selectedColor)
                                
                            )
                            .onTapGesture {
                                selectedColor = color
                            }
                    }
                }
            }
            .padding(.horizontal)


            Spacer()
        }
        .padding(.top)
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.white.ignoresSafeArea())
    }
}


#Preview {
    LightDetailView()
}
