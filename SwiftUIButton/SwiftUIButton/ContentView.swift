//
//  ContentView.swift
//  SwiftUIButton
//
//  Created by Marble Interactive SL on 7/1/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        /* VStack {
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
         */
        
        //Same Button with Label and Icon
        Button {
           print("Delete button tapped")
        } label: {
            Label(
                title: {
                    Text("Delete")
                        .fontWeight(.semibold)
                        .font(.title)
                }, icon: {
                    Image(systemName: "trash")
                        .font(.title)
                }
            )
            .padding()
            .foregroundColor(.white)
            .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(40)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
