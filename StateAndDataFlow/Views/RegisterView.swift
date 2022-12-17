//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 14.12.2022.
//

import SwiftUI

struct RegisterView: View {
    @State private var name = ""
    
    var body: some View {
        VStack {
            HStack {
                Spacer(minLength: 30)
                
                TextField("Enter your name...", text: $name)
                    .multilineTextAlignment(.center)
                
                Text(name.count.formatted())
                    .foregroundColor(validateName() ? .green : .red)
                    .padding(.trailing)
            }
            Button(action: registerUser) {
                HStack {
                    Text("Log In")
                    Image(systemName: "checkmark.circle")
                        .tint(.green)
                }
            }
            .disabled(!validateName())
        }
    }
    
    private func validateName() -> Bool {
        name.count >= 3
    }
    
    private func registerUser() {
        StorageManager.shared.registerUser(name)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
