//
//  Title.swift
//  BiometricAuth
//
//  Created by Joshua Butler on 3/18/24.
//

import SwiftUI

struct Title: View {
    var body: some View {
        Text("Authenticator")
            .bold()
            .font(.title)
            .foregroundColor(.white)
    }
}

#Preview {
    Title()
        .background(LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
}
