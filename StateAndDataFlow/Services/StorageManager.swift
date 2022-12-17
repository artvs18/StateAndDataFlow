//
//  StorageManager.swift
//  StateAndDataFlow
//
//  Created by Artemy Volkov on 16.12.2022.
//


import SwiftUI

class StorageManager: ObservableObject {
    @AppStorage("user") var userData: Data = Data()
    
    static let shared = StorageManager()
    
    private init() {}
    
    func registerUser(_ name: String) {
        let user = User(name: name, isRegistered: true)
        guard let userData = try? JSONEncoder().encode(user) else { return }
        self.userData = userData
    }
    
    func fetchUser() -> User {
        guard let user = try? JSONDecoder().decode(User.self, from: userData) else {
            return User(name: "", isRegistered: false)
        }
        return user
    }

    func deleteUser() {
        let user = User(name: "", isRegistered: false)
        guard let userData = try? JSONEncoder().encode(user) else { return }
        self.userData = userData
    }
}
