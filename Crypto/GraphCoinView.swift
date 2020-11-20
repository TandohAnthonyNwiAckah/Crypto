//
//  GraphCoinView.swift
//  Crypto
//
//  Created by Tanacom on 11/20/20.
//

import SwiftUI

struct GraphCoinView: View {
    
    let lineCoordinates : [CGFloat]
    let title : String
    
    var body: some View {
        
 
//        LineChartController(lineCoordinates:[000,4000,6000,2000,5000,9000,3000,6000,1000,7000],inline:false)
            
            
        LineChartController(lineCoordinates:lineCoordinates,inline:false)
            

            
            
//            .frame(
//            minWidth: 0,
//            maxWidth:.infinity,
//            minHeight:0,
//            maxHeight:250
//
//            )
//
            .padding(.leading,30)
        
        
            .navigationTitle(Text(title))
          


        
        
    }
}









struct GraphCoinView_Previews: PreviewProvider {
    static var previews: some View {
        GraphCoinView(lineCoordinates: [1133,3244,134], title: "TEST CASE")
    }
}
