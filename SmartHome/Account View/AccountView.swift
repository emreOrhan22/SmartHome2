//
//  AccountView.swift
//  SmartHome
//
//  Created by Emre on 20.03.2025.
//

import SwiftUI

struct AccountView: View {
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = true
    @AppStorage("isProfileSelected") var isProfileSelected: Bool = true
    
    var body: some View {
        NavigationView{
            VStack{
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)
                    .padding()
                
                Text("Example")
                    .font(.title)
                    .bold()
                
                Text("example@example.com")
                    .foregroundColor(.gray)
                
                
                Spacer()
                
                Button(action: {
                    isLoggedIn = false
                    isProfileSelected = false
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
