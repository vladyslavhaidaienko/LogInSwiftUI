//
//  DataManager.swift
//  LogInApp
//
//
//  Created by Vladyslav Haidaienko on 05.11.2021.
//

import Foundation

class DataManager {
    static let shared = DataManager()

    private init() {}
    
    func saveData(user: User) {
        let encoder = JSONEncoder()
        guard let data = try? encoder.encode(user) else { return }
        UserDefaults.standard.set(data, forKey: "userName")
    }
    
    func downloadData() -> User {
        let decoder = JSONDecoder()
        guard let data = UserDefaults.standard.object(forKey: "userName") as? Data else { return User() }
        guard let user = try? decoder.decode(User.self, from: data) else { return User() }
        return user
    }
    
    func logOut(userManager: UserManager) {
        userManager.user.isRegistered = false
        userManager.user.name = ""
        UserDefaults.standard.removeObject(forKey: "userName")
    }
}
