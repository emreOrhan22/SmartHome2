//
//  View+Extension.swift
//  SmartHome
//
//  Created by Emre on 26.03.2025.
//

import SwiftUI

extension View {
    func dismissKeyboardOnTap() -> some View {
        self.modifier(KeyboardDismissModifier())
    }
}

