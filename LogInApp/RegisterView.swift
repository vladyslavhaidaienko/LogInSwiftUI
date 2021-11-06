//
//  RegisterView.swift
//  LogInApp
//
//
//  Created by Vladyslav Haidaienko on 05.11.2021.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject private var userManager: UserManager
        
    var body: some View {
        VStack {
            TextFieldForUserName(
                name: $userManager.user.name,
                nameIsCorrect: userManager.nameIsCorrect
            )
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
            }
            .disabled(!userManager.nameIsCorrect)
        }
    }
    
    private func registerUser() {
        if !userManager.user.name.isEmpty {
            userManager.user.isRegistered.toggle()
            DataManager.shared.saveData(user: userManager.user)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

struct TextFieldForUserName: View {
    @Binding var name: String
    
    var nameIsCorrect = false
    
    var body: some View {
        ZStack {
            TextField("Enter your name...", text: $name)
                .multilineTextAlignment(.center)
            HStack {
                Spacer()
                Text("\(name.count)")
                    .padding()
                    .foregroundColor(nameIsCorrect ? .green : .red)
            }
        }
    }
}
