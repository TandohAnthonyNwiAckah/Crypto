//
//  LineChartController.swift
//  Crypto
//
//  Created by Tanacom on 11/20/20.
//
import SwiftUI
import UIKit


struct LineChartController: UIViewRepresentable {

    let lineCoordinates: [CGFloat]
    let inline: Bool
    
    func updateUIView(_ uiView: LineChart, context: UIViewRepresentableContext<LineChartController>) {
        // ..
    }
    
    func makeUIView(context: Context) -> LineChart {
        
        let lineChart = LineChart()
        
        lineChart.addLine(lineCoordinates)


        if inline {
            lineChart.y.labels.visible = false
            lineChart.x.labels.values = ["Yesterday", "Today", "Tomorrow"]
        } else {

            lineChart.x.labels.values = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul","Aug","Sep","Oct","Nov","Dec"]
        }
//        
        return lineChart
    }
}
