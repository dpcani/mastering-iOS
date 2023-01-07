//
//  ContentView.swift
//  SwiftUIScrollView
//
//  Created by Marble Interactive SL on 7/1/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                VStack (alignment: .leading){
                    Text("MONDAY, JAN 7")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text("Your Reading")
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                }
                .padding(.horizontal)
                Spacer()
            }
            HStack {
                CardView(image: "swiftui-button", category: "SwiftUI", heading: "Drawing a Border with Rounded Corners", author: "Simon Ng")
                    .frame(width: 300)
                CardView(image: "macos-programming", category: "macOS", heading: "Building a Simple Editing App", author: "Gabriel Theodoropoulos")
                    .frame(width: 300)
                CardView(image: "flutter-app", category: "Flutter", heading: "Building a Complex Layout with Flutter", author: "Lawrence Tan")
                    .frame(width: 300)
                CardView(image: "natural-language-api", category: "iOS", heading: "What's New in Natural Language API", author: "Sai Kambampati")
                    .frame(width: 300)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
