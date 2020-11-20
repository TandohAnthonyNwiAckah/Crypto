//
//  ContentView.swift
//  Crypto
//
//  Created by Tanacom on 11/10/20.
//

import SwiftUI


struct Coin:Hashable {
    let id,name,price,icon:String
    let lineCoordinates: [CGFloat]
}

struct ContentView: View {
    
    
    var rates : [Coin] = [
    Coin(id: "BTC", name: "BitCoin", price: "9793.31", icon: "bitcoin",lineCoordinates: [1000,4000,6000,2000,5000,9000,3000,6000,14000,7000]),
        
    Coin(id: "LTC", name: "Litecoin", price: "93.08", icon: "litecoin",lineCoordinates: [6000,400,6000,2000,5000,9000,3000,600,1000,700]),
        
    Coin(id: "XIP", name: "Ripple", price: "0.98", icon: "ripple",lineCoordinates: [400,4000,600,2000,5000,9000,3000,6000,1000,7000]),
        
    Coin(id: "TRX", name: "Tron", price: "23.10", icon: "tron",lineCoordinates: [100,4000,6000,200,5000,9000,3000,6000,1000,700]),
        
    Coin(id: "ETH", name: "Ethereum", price: "200.98", icon: "ethereum",lineCoordinates: [800,4000,6000,2000,500,9000,3000,6000,100,7000])
        
    ]
    
    
    var wallets : [Coin] = [

    Coin(id: "LTC", name: "Litecoin", price: "293.08", icon: "litecoin",lineCoordinates: [900,4000,6000,2000,5000,9000,3000,6000,1000,7000]),
        
    Coin(id: "XIP", name: "Ripple", price: "10.98", icon: "ripple",lineCoordinates: [10,4000,6000,2000,5000,900,3000,6000,1000,7000]),
        
    Coin(id: "ETH", name: "Ethereum", price: "400.98", icon: "ethereum",lineCoordinates: [800,4000,6000,200,5000,9000,3000,6000,1000,7000])
        
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
                
                LineChartController(lineCoordinates:[3,2,6],inline:true)
                    .frame(
                    minWidth: 0,
                    maxWidth:.infinity,
                    minHeight:0,
                    maxHeight:150

                ).padding()

        
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
                           
                            NavigationLink(destination:GraphCoinView(lineCoordinates: coin.lineCoordinates, title: coin.name)){
                            
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
