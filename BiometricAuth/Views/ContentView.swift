//
//  ContentView.swift
//  BiometricAuth
//
//  Created by Joshua Butler on 3/18/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var authenticationManager = AuthenticationManager()
       
    var body: some View {
        NavigationView {
            VStack {
                if authenticationManager.isAuthenticated {
                    VStack(spacing: 40) {
                        Title()
                        
                        Text("Welcome in! You are now authenticated.")
                            .foregroundColor(.white)
                        
                        PrimaryButton(showImage: false, text: "Logout")
                            .onTapGesture {
                                authenticationManager.logout()
                            }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
                } else {
                    LoginView()
                        .environmentObject(authenticationManager)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .alert(isPresented: $authenticationManager.showAlert) {
                Alert(title: Text("Error"), message: Text(authenticationManager.errorDescription ?? "Error: trying to login with credentials instead. Please try again"), dismissButton: .default(Text("ok")))
        }
        }
    }
}

#Preview {
    ContentView()
}
