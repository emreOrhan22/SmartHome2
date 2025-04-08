//
//  AccountView.swift
//  SmartHome
//
//  Created by Emre on 20.03.2025.
//

import SwiftUI

struct AccountView: View {
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = true
    
    var body: some View {
        NavigationView{
            VStack{
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)
                    .padding()
                
                Text("Ronald Reagan")
                    .font(.title)
                    .bold()
                
                Text("ronaldreagen@example.com")
                    .foregroundColor(.gray)
                
                
                Spacer()
                
                Button(action: {
                    isLoggedIn = false
                }) {
                Text("Logout")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(10)
                    .padding(.horizontal)
                }
                .padding(.bottom, 30)
            }
            .navigationTitle("Account")
        }
    }
}

#Preview {
    AccountView()
}
