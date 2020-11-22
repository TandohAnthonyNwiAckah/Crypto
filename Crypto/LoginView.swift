//
//  LoginView.swift
//  Crypto
//
//  Created by Tanacom on 11/20/20.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    var manager: HttpAuth
    
    var body: some View {
        NavigationView {
            
            Form {
                TextField("Your username", text: $username)
                    .textCase(.lowercase)
                
                SecureField("Your Password", text: $password)
        
                HStack {
                    
                    Spacer()
                    
                    Button(action: {
                        self.manager.checkDetails(username: self.username, password: self.password)
                    }) {
                        Text("Login")
                            .foregroundColor(Color.white)
                            .padding([.trailing, .leading], 20)
                            .padding([.top, .bottom], 15)
                            .background(Color.red)
                            .cornerRadius(10)
                            
            
                    }
                    Spacer()
                }
                
            }.navigationBarTitle(Text("Crypto"))
            
        }
    }
}


struct RootView : View {
 
    @StateObject var manager = HttpAuth()
    
    var body: some View {
        
        if manager.authenticated {
            ContentView()
        }else {
            LoginView(manager: manager)
        }
    }
}
