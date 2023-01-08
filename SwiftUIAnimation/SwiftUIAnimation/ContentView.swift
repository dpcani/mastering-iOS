//
//  ContentView.swift
//  SwiftUIAnimation
//
//  Created by Marble Interactive SL on 8/1/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isLoading = false
    
    var body: some View {
        ZStack {
            Text("Loading")
                .font(.system(.body, design: .rounded))
                .bold()
                .offset(x: 0, y: -25)
            
            RoundedRectangle(cornerRadius: 3)
                .stroke(Color(.systemGray5), lineWidth: 3)
                .frame(width: 250, height: 3)
            
            RoundedRectangle(cornerRadius: 3)
                .stroke(.green, lineWidth: 3)
                .frame(width: 30, height: 3)
                .offset(x: isLoading ? -110 : 110, y:0)
                .animation(.linear(duration: 1).repeatForever(autoreverses: false), value: isLoading)
                .onAppear() {
                    isLoading = true
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
