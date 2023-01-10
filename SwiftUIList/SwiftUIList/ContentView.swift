//
//  ContentView.swift
//  SwiftUIList
//
//  Created by Marble Interactive SL on 10/1/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            List {
                ForEach(1...4, id: \.self) { index in
                    Text("Item \(index)")
                }
            }
            
            List(1...4, id: \.self) {
                Text("Item \($0)")
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
