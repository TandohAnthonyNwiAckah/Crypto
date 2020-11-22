//
//  RootView.swift
//  Crypto
//
//  Created by Tanacom on 11/22/20.
//

import SwiftUI


struct RootView: View {

    @State private var manager = HttpAuth()

    var body: some View {
        VStack {
            if manager.authenticated {
                ContentView()
            } else {
                LoginView(manager: $manager)
            }
        }
    }
}


struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
