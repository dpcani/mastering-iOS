//
//  ContentView.swift
//  SwiftUIShape
//
//  Created by Marble Interactive SL on 8/1/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Path() { path in
                path.move(to: CGPoint(x: 187, y: 187))
                path.addArc(center: .init(x: 187, y: 187), radius: 150, startAngle: .degrees(0), endAngle: .degrees(190), clockwise: true)
            }
            .fill(.yellow)
            
            Path() { path in
                path.move(to: CGPoint(x: 187, y: 187))
                path.addArc(center: .init(x: 187, y: 187), radius: 150, startAngle: .degrees(190), endAngle: .degrees(110), clockwise: true)
            }
            .fill(.teal)
            
            Path() { path in
                path.move(to: CGPoint(x: 187, y: 187))
                path.addArc(center: .init(x: 187, y: 187), radius: 150, startAngle: .degrees(110), endAngle: .degrees(90), clockwise: true)
            }
            .fill(.blue)
            
            Path() { path in
                path.move(to: CGPoint(x: 187, y: 187))
                path.addArc(center: .init(x: 187, y: 187), radius: 150, startAngle: .degrees(90), endAngle: .degrees(360), clockwise: true)
            }
            .fill(.purple)
            .offset(x: 20, y: 20)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
