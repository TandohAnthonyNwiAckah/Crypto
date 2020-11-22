//
//  RootView.swift
//  Crypto
//
//  Created by Tanacom on 11/22/20.
//

import SwiftUI


struct RootView: View {

    @StateObject var manager = HttpAuth()

    var body: some View {
        
        VStack {
            if manager.authenticated {
                ContentView()
            } else {
                LoginView(manager: manager)
            }
        }
    }
}


struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
