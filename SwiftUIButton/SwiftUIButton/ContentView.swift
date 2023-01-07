//
//  ContentView.swift
//  SwiftUIButton
//
//  Created by Marble Interactive SL on 7/1/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button {
               print("Button pressed!")
            } label: {
                Text("Hello World")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                    .background(.purple)
                    .foregroundColor(.white)
                    .padding(10)
                    .border(.purple, width: 5)
                
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
