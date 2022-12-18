//
//  DataManager.swift
//  StateAndDataFlow
//
//  Created by Artemy Volkov on 16.12.2022.
//


import SwiftUI

class DataManager: ObservableObject {
    @AppStorage("user") private var userData: Data?
    
    static let shared = DataManager()
    
    private init() {}
    
    func save(user: User) {
        userData = try? JSONEncoder().encode(user)
    }
    
    func fetchUser() -> User {
        guard let userData else { return User() }
        let user = try? JSONDecoder().decode(User.self, from: userData)
        guard let user = user else { return User() }
        return user
    }

    func clear(userManager: UserManager) {
        userManager.user.isRegistered = false
        userManager.user.name = ""
        userData = nil
    }
}
