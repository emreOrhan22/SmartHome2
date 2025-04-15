//
//  LightDetailViewModel.swift
//  SmartHome
//
//  Created by Halit Ayhan Aydın on 15.04.2025.
//

import SwiftUI

class LightDetailViewModel: ObservableObject {
    @Published var brightnessLevel: Int = 0
    
    // Lamba durumunu tutan flag (Açık/Kapalı)
    var isLampOn: Bool {
        brightnessLevel > 0
    }
    
    // Lamba görselinin opaklığını parlaklığa göre hesaplar.
    func getLampOpacity() -> Double {
        return Double(brightnessLevel) / 100.0
    }

    // Lamba gölgesinin rengini parlaklık seviyesine göre döndürür.
    func getGlowColor() -> Color {
        return Color.yellow
    }

    // Parlaklığa göre gölge gücünü (ışık etkisi) hesaplar.
    func getGlowStrength() -> Double {
        return Double(brightnessLevel) / 100.0
    }

    // Lamba açma / kapama fonksiyonu
    func toggleLamp() {
        brightnessLevel = isLampOn ? 0 : 100 // Açma / kapama işlemi
    }

    // Parlaklık seviyesine göre kullanıcıya anlamlı açıklama metni verir.
    func brightnessDescription() -> String {
        switch brightnessLevel {
        case 0: return "Off"
        case 1..<30: return "Low Brightness"
        case 30..<70: return "Medium Brightness"
        case 70..<100: return "High Brightness"
        default: return "Full Brightness"
        }
    }
}
