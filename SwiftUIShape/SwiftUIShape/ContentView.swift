//
//  ContentView.swift
//  SwiftUIShape
//
//  Created by Marble Interactive SL on 8/1/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Path() { path in
            path.move(to: CGPoint(x: 200, y: 200))
            path.addArc(center: .init(x: 200, y: 200), radius: 150, startAngle: .degrees(0), endAngle: .degrees(90), clockwise: true)
        }
        .fill(.green)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
