//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Artemy Volkov on 18.12.2022.
//

import Foundation

class UserManager: ObservableObject {
    @Published var user = User()
    
    var nameIsValid: Bool {
        user.name.count >= 3
    }
    
    init() {}
    
    init(user: User) {
        self.user = user
    }
}

struct User: Codable {
    var name = ""
    var isRegistered = false
}
