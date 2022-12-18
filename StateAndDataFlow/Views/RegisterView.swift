//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 14.12.2022.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        VStack {
            HStack {
                Spacer(minLength: 30)
                
                TextField("Enter your name...", text: $userManager.user.name)
                    .multilineTextAlignment(.center)
                
                Text(userManager.user.name.count.formatted())
                    .foregroundColor(userManager.nameIsValid ? .green : .red)
                    .padding(.trailing)
            }
            Button(action: registerUser) {
                HStack {
                    Text("Log In")
                    Image(systemName: "checkmark.circle")
                        .tint(.green)
                }
            }
            .disabled(!userManager.nameIsValid)
        }
    }
    
    
    private func registerUser() {
        userManager.user.isRegistered.toggle()
        DataManager.shared.save(user: userManager.user)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
