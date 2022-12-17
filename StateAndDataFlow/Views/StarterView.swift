//
//  StarterView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 14.12.2022.
//

import SwiftUI

struct StarterView: View {
    @StateObject var storageManager = StorageManager.shared
    
    var body: some View {
        Group {
            if storageManager.fetchUser().isRegistered {
                ContentView()
            } else {
                RegisterView()
            }
        }
    }
}

struct StarterView_Previews: PreviewProvider {
    static var previews: some View {
        StarterView()
    }
}
