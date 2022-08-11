//
//  LoginView.swift
//  NewMealTracker
//
//  Created by Dana Hindenburg on 8/7/22.
//

import SwiftUI

struct LoginList: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @ObservedObject var userService = UserService()
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    TextField("User Name", text: $username)
                    TextField("Password", text: $password)
                }
                Button("Login", action: signin).padding(10)
            }
            
            .navigationTitle("Login")
        }
    }
    
    func signin() {
        userService.registerUser.username = username
        userService.registerUser.password = password
        userService.getUser()
    }
}

struct LoginList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
            LoginList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
