//
//  ContentView.swift
//  Crypto
//
//  Created by Tanacom on 11/10/20.
//

import SwiftUI


struct Coin:Hashable {
    let id,name,price,icon:String
}


struct ContentView: View {
    
    
    var rates : [Coin] = [
    Coin(id: "BTC", name: "BitCoin", price: "9793.31", icon: "bitcoin"),
        
    Coin(id: "LTC", name: "Litecoin", price: "93.08", icon: "litecoin"),
        
    Coin(id: "XIP", name: "Ripple", price: "0.98", icon: "ripple"),
        
    Coin(id: "TRX", name: "Tron", price: "23.10", icon: "tron"),
        
    Coin(id: "ETH", name: "Ethereum", price: "200.98", icon: "ethereum")
        
    ]
    
    var body: some View {
        
        NavigationView{
            
            
            VStack{
                
            
            Text("Your crypto balance")
                .padding()
            
                Text("$3,133.7")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .padding()
            
               
                List{
                    
                    Section(header: Text("Current Prices")){
                        
                        ForEach(rates,id: \.self) {
                            coin in
                            Text(coin.name)
                        
                        }
                    }
                }
                
            }
                
//            NavigationLink(destination: Text("Hello")){
//
//                Text("Go to Hello")
//                    .padding()
//            }
            
           .navigationTitle(Text("DashBoard"))
           .navigationBarHidden(true)
            
            
            
            
        }
    
    
}

}
    
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
