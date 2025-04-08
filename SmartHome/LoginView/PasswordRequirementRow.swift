//
//  PasswordRequirementRow.swift
//  SmartHome
//
//  Created by Emre on 26.03.2025.
//
import SwiftUI

struct PasswordRequirementRow: View {
    let requirement: String
    let met: Bool

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: met ? "checkmark.circle.fill" : "circle")
                .foregroundColor(met ? .green : .gray)
            Text(requirement)
                .foregroundColor(.gray)
                .font(.subheadline)
            Spacer()
        }
    }
}



#Preview {
    SignUpView()
}
