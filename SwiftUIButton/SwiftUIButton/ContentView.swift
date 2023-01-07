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
                HStack {
                    Image(systemName: "trash")
                        .font(.title)
                    Text("Delete")
                        .fontWeight(.semibold)
                        .font(.title)
                }
                .padding()
                .foregroundColor(.white)
                .background(.red)
                .cornerRadius(40)
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
