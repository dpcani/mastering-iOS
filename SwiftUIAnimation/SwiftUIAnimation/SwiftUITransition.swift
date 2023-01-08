//
//  SwiftUITransition.swift
//  SwiftUIAnimation
//
//  Created by Marble Interactive SL on 8/1/23.
//

import SwiftUI

struct SwiftUITransition: View {
    
    @State private var show = false
    
    var body: some View {
        
        VStack {
            
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 300, height: 300)
                .foregroundColor(.green)
                .overlay(
                    Text("Show Details")
                        .font(.system(.largeTitle, design: .rounded))
                        .bold()
                        .foregroundColor(.white)
                )
            
            if show {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 300, height: 300)
                    .foregroundColor(.purple)
                    .overlay(
                        Text("Well, here is the details")
                            .font(.system(.largeTitle, design: .rounded))
                            .bold()
                            .foregroundColor(.white)
                    )
                    .transition(AnyTransition.offset(x: -600, y: 0).combined(with: .scale).combined(with: .opacity))
            }
        }
        .onTapGesture {
            withAnimation(.spring()) {
                self.show.toggle()
            }
        }
    }
}

struct SwiftUITransition_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUITransition()
    }
}
