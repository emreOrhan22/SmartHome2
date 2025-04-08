//
//  AuthButton.swift
//  SmartHome
//
//  Created by Emre on 26.03.2025.
//

import SwiftUI

struct AuthButton: View {
    var icon: String
    var text: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: icon)
                Text(text)
                    .fontWeight(.semibold)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color(.systemGray5))
            .cornerRadius(12)
        }
        .foregroundColor(.black)
    }
}

#Preview {
    LoginView()
}
