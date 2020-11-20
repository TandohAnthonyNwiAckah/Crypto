//
//  ContentView.swift
//  Crypto
//
//  Created by Tanacom on 11/10/20.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        NavigationView{
            
            NavigationLink(destination: Text("Hello")){
                
                Text("Go to Hello")
                    .padding()
            }
           .navigationTitle(Text("DashBoard"))
        }
    
    
}

}
    
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
