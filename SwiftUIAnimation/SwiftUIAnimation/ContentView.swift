//
//  ContentView.swift
//  SwiftUIAnimation
//
//  Created by Marble Interactive SL on 8/1/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var progress: CGFloat = 0.0
    
    var body: some View {
        ZStack {
            Text("\(Int(progress * 100))%")
                .font(.system(.body, design: .rounded))
                .bold()
            
           Circle()
                .stroke(Color(.systemGray5), lineWidth: 10)
                .frame(width: 150, height: 150)
            
            Circle()
                .trim(from: 0, to: progress)
                .stroke(.green, lineWidth: 10)
                .frame(width: 150, height: 150)
                .rotationEffect(Angle(degrees: -90))
        }
        .onAppear() {
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
                self.progress += 0.05
                if self.progress >= 1 {
                    timer.invalidate()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
