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
    
    
    var wallets : [Coin] = [

    Coin(id: "LTC", name: "Litecoin", price: "293.08", icon: "litecoin"),
        
    Coin(id: "XIP", name: "Ripple", price: "10.98", icon: "ripple"),
        
    Coin(id: "ETH", name: "Ethereum", price: "400.98", icon: "ethereum")
        
    ]
    
    
    
    
    
    
    @State var is360 = false
    
    var body: some View {
        
        NavigationView{
            
            
            VStack{
                
                Button(action: {
                    self.is360.toggle()
                })  {
                    
                    BadgeSymbol()
                        .frame(width: 150, height: 150)
                        .rotation3DEffect(.degrees(is360 ? 360 : 0),
                            axis: (x : 0 , y : 1, z : 1))
                        .animation(.easeIn)
//                        .animation(.basic(duration:0.7,curve: .easeIn))
                    

                }
                
                

            
            Text("Your crypto balance")
                .padding()
            
                Text("$3,133.7")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .padding()
            
               
                List{
                    
                    
                    Section(header: Text("My Wallets")){
                
                        ForEach(wallets,id: \.self) { coin in
                            
                            HStack{
                            
                            Image(coin.icon)
                                .resizable()
                                .frame(width:40,height:40)
                            
                               Text("\(coin.name) (\(coin.id))")
                                
                                Spacer()
                                
                                Text("$\(coin.price)").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        
                            }
                                
                        }
                    }
                    
                    
                    Section(header: Text("Current Prices")){
                
                        ForEach(rates,id: \.self) { coin in
                           
                            NavigationLink(destination:Text("Rating Details")){
                            
                            HStack{
                            
                            Image(coin.icon)
                                .resizable()
                                .frame(width:40,height:40)
                            
                               Text("\(coin.name) (\(coin.id))")
                                
                                Spacer()
                                
                                Text("$\(coin.price)").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        
                            }
                            
                            }
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
