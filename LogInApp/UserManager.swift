//
//  UserManager.swift
//  LogInApp
//
//
//  Created by Vladyslav Haidaienko on 05.11.2021.
//

import Combine

final class UserManager: ObservableObject {
    @Published var user = User()
    
    var nameIsCorrect: Bool {
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
