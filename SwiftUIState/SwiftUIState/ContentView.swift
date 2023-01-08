//
//  ContentView.swift
//  SwiftUIState
//
//  Created by Marble Interactive SL on 8/1/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            PlayStopButton()
            
            CounterButton()
        }
    }
}

struct CounterButton: View {
    
    @State private var counter = 0
    
    var body: some View {
        Button{
            counter = counter + 1
        } label: {
            Text("\(counter)")
        }
        .frame(width: 140, height: 140)
        .background(.red)
        .clipShape(Circle())
        .foregroundColor(.white)
        .font(.system(size: 60, design: .rounded))
        .fontWeight(.bold)
    }
}

struct PlayStopButton: View {
    
    @State private var isPlaying = false
    
    var body: some View {
        Button {
            isPlaying.toggle()
        } label: {
            Image(systemName: isPlaying ? "stop.circle.fill" : "play.circle.fill")
                .font(.system(size: 150))
                .foregroundColor(isPlaying ? .red : .green)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
