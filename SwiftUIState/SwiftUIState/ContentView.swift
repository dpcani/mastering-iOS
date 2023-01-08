//
//  ContentView.swift
//  SwiftUIState
//
//  Created by Marble Interactive SL on 8/1/23.
//

import SwiftUI

struct ContentView: View {
    @State private var counterRed = 0
    @State private var counterGreen = 0
    @State private var counterBlue = 0
    
    var body: some View {
        VStack(spacing: 25) {
            /*
                PlayStopButton()
                CounterButton()
                CounterButtonCircle()
            */
            
            /*
                CustomCounterButton(counter: $counter, background: .red, forecolor: .white)
                CustomCounterButton(counter: $counter, background: .green, forecolor: .white)
                CustomCounterButton(counter: $counter, background: .blue, forecolor: .white)
            */
            
            Spacer()
            Text("\(counterRed + counterGreen + counterBlue)")
                .font(.system(size: 150, weight: .bold, design: .rounded))
                .padding()
            Spacer()
            HStack(alignment: .center, spacing: 25) {
                CustomCounterButton2(counter: $counterRed, background: .red, forecolor: .white)
                CustomCounterButton2(counter: $counterGreen, background: .green, forecolor: .white)
                CustomCounterButton2(counter: $counterBlue, background: .blue, forecolor: .white)
            }
            .padding([.horizontal])
            Spacer()
        }
    }
}

struct CustomCounterButton2: View {
    
    @Binding var counter: Int
    var background: Color
    var forecolor: Color
    
    var body: some View {
        Button {
            counter += 1
        } label: {
            Circle()
                .frame(width: 100, height: 100)
                .foregroundColor(background)
                .overlay {
                    Text("\(counter)")
                        .font(.system(size: 60, weight: .bold, design: .rounded))
                        .foregroundColor(forecolor)
                }
        }
    }
}



struct CustomCounterButton: View {
    
    @Binding var counter: Int
    var background: Color
    var forecolor: Color
    
    var body: some View {
        Button {
            counter += 1
        } label: {
            Circle()
                .frame(width: 140, height: 140)
                .foregroundColor(background)
                .overlay {
                    Text("\(counter)")
                        .font(.system(size: 60, weight: .bold, design: .rounded))
                        .foregroundColor(forecolor)
                }
        }
    }
}


struct CounterButtonCircle: View {
    
    @State private var counter = 0
    
    var body: some View {
        Button {
            counter += 1
        } label: {
            Circle()
                .frame(width: 140, height: 140)
                .foregroundColor(.blue)
                .overlay {
                    Text("\(counter)")
                        .font(.system(size: 60, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                }
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
