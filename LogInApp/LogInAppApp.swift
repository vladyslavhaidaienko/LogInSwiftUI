//
//  LogInAppApp.swift
//  LogInApp
//
//
//  Created by Vladyslav Haidaienko on 05.11.2021.
//

import SwiftUI

@main
struct LogInAppApp: App {
    @StateObject private var userManager = UserManager(user: DataManager.shared.downloadData())
    
    var body: some Scene {
        WindowGroup {
            StarterView()
                .environmentObject(userManager)
        }
    }
}
