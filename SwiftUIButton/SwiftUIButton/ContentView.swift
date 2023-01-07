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
               print("Delete Button pressed!")
            } label: {
                Image(systemName: "trash")
                    .font(.largeTitle)
                    .foregroundColor(.red)
                
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
