//
//  FancyButton.swift
//  SwiftUIAnimation
//
//  Created by Marble Interactive SL on 8/1/23.
//

import SwiftUI

struct FancyButton: View {
    
    @State private var processing = false
    @State private var completed = false
    @State private var loading = false
    
    var body: some View {
        RoundedRectangle(cornerRadius: 30)
            .frame(width: processing ? 300 : 250, height: 65)
            .foregroundColor(completed ? .red : .green)
            .overlay {
                
                if !processing {
                    Text("Submit")
                        .font(.system(.largeTitle, design: .rounded))
                        .bold()
                        .foregroundColor(.white)
                }
                
                if processing && !completed {
                    HStack {
                        
                        Circle()
                            .trim(from: 0, to: 0.9)
                            .stroke(Color.white, lineWidth: 3)
                            .frame(width: 30, height: 30)
                            .rotationEffect(.degrees(loading ? 360 : 0))
                            .animation(.easeOut.repeatForever(autoreverses: false), value: loading)
                        
                        Text("Processing")
                            .font(.system(.largeTitle, design: .rounded))
                            .bold()
                            .foregroundColor(.white)
                    }
                    .transition(.opacity)
                    .onAppear() {
                        self.startProcessing()
                    }
                }
                
                if completed {
                    Text("Done")
                        .font(.system(.title, design: .rounded))
                        .bold()
                        .foregroundColor(.white)
                        .onAppear() {
                            self.endProcessing()
                        }
                }
                
            }
            .animation(.spring(), value: loading)
            .onTapGesture {
                withAnimation(.spring()) {
                    if !loading {
                        self.processing.toggle()
                    }
                }
            }
    }
    
    private func startProcessing() {
        self.loading = true
        
        // Simulate an operation by using DispatchQueue.main.asyncAfter
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            self.completed = true
        }
    }
    
    private func endProcessing() {
        // Reset the button's state
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.processing = false
            self.completed = false
            self.loading = false
        }
    }
}

struct FancyButton_Previews: PreviewProvider {
    static var previews: some View {
        FancyButton()
    }
}
