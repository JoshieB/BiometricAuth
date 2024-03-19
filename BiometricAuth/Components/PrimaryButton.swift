//
//  PrimaryButton.swift
//  BiometricAuth
//
//  Created by Joshua Butler on 3/18/24.
//

import SwiftUI

struct PrimaryButton: View {
    var image: String?
    var showImage = true
    var text: String
    
    var body: some View {
        HStack {
            if showImage {
                Image(systemName: image ?? "person.fill")
                    .foregroundColor(.black)
            }
            
            Text(text)
                .foregroundColor(.black)
                .bold()
        }
        .padding()
        .padding(.horizontal)
        .background(.white)
        .cornerRadius(30)
        .shadow(radius: 10)
    }
}

#Preview {
    PrimaryButton(image: "faceid", text: "Login with FaceID")
}
