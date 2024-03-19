//
//  LoginView.swift
//  BiometricAuth
//
//  Created by Joshua Butler on 3/18/24.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authenticationManager: AuthenticationManager
    var body: some View {
        VStack(spacing: 40.0) {
            Title()
            //PrimaryButton(image: "faceid", text: "Login with FaceID")
            
            switch authenticationManager.biometryType {
            case .touchID:
                PrimaryButton(image: "touchid", text: "Login with TouchID")
                    .onTapGesture {
                        Task.init {
                            await authenticationManager.authenticateWithBiometrics()
                        }
                    }
            case .faceID:
                PrimaryButton(image: "faceid", text: "Login with FaceID")
                    .onTapGesture {
                        Task.init {
                            await authenticationManager.authenticateWithBiometrics()
                        }
                    }
            case .opticID:
                PrimaryButton(image: "opticid", text: "Login with OpticID")
                    .onTapGesture {
                        Task.init {
                            await authenticationManager.authenticateWithBiometrics()
                        }
                    }
            default:
                NavigationLink {
                    CredentialsLoginView()
                        .environmentObject(authenticationManager)
                } label: {
                    PrimaryButton(image: "person.fill", text: "Login with your credentials")
                }
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

#Preview {
    LoginView()
        .environmentObject(AuthenticationManager())
}
