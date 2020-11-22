//
//  LoginView.swift
//  Crypto
//
//  Created by Tanacom on 11/20/20.
//

import SwiftUI

struct LoginView : View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    @Binding var manager: HttpAuth
    
    
    var body: some View {
        
        NavigationView {
            
            Form {
                TextField(Cons.USERNAME, text: $username)
                
                SecureField(Cons.PASSWORD, text: $password)
        
                HStack {
                    
                    Spacer()
                    
                    Button(action: {
                        self.manager.checkDetails(username: self.username, password: self.password)
                    }) {
                        Text(Cons.LOGIN)
                            .foregroundColor(Color.white)
                            .padding([.trailing, .leading], 20)
                            .padding([.top, .bottom], 15)
                            .background(Color.blue)
                            .cornerRadius(10)
                       
            
                    }
                    Spacer()
                }
                
            }.navigationBarTitle(Text(Cons.APPNAME))
            
        }
    }
}
