//
//  ContentView.swift
//  Crypto
//
//  Created by Tanacom on 11/10/20.
//

import SwiftUI



struct BadgeSymbol:View {
    
    
    static let symbolColor = Color(red:79.0/255,green:79.0/255,blue:191.0/255)
    
    var body: some View{
        
        GeometryReader { geometry in
            
            Path { path in
                
                let width = min(geometry.size.width,geometry.size.height)
                let height = width * 0.75
                let spacing = width*0.028
                let middle = width/2
                let topWidth = 0.226 * width
                let topHeight = 0.488 * height
                
                path.addLines([
                    CGPoint(x:middle,y: spacing),
                    CGPoint(x:middle-topWidth,y: topHeight-spacing),
                    CGPoint(x: middle, y: topHeight / 2 + spacing),
                    CGPoint(x: middle+topWidth, y: topHeight-spacing),
                    CGPoint(x: middle, y:spacing)
                ])
                
                path.move(to: CGPoint(x:middle,y:topHeight / 2 + spacing * 3))
                
                path.addLines([
                
                    CGPoint(x:middle-topWidth,y: topHeight+spacing),
                    
                    CGPoint(x: spacing, y:height - spacing),
                    
                    CGPoint(x: width-spacing, y:height - spacing),
                    
                    CGPoint(x: middle + topWidth, y:topHeight + spacing),
                    
                    CGPoint(x: middle, y:topHeight / 2 +  spacing * 3 ),
                ])
            }
            .fill(Self.symbolColor)
            
        }
    }
}



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
                    Section(header: Text("Current Prices")){
                
                        ForEach(rates,id: \.self) { coin in
                            
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
