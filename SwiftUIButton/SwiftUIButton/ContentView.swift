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
            CustomButton(icon: "trash", title: "Delete")
            CustomButton(icon: "square.and.arrow.up", title: "Share")
            CustomButton(icon: "square.and.pencil", title: "Edit")
            
            CustomCircleButton()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CustomCircleButton: View {
    var body: some View {
        Button(action: {
            print("Circle button tapped!")
        }) {
            Image(systemName: "plus")
        }.buttonStyle(RotationButtonStyle())
    }
}

struct CustomButton: View {
    
    var icon: String
    var title: String
    
    var body: some View {
        Button(action: {
            print("tapped!")
        }) {
            HStack {
                Image(systemName: icon)
                    .font(.title)
                Text(title)
                    .fontWeight(.semibold)
                    .font(.title)
            }
            
        }
        .buttonStyle(GradientBackgroundStyle())
    }
}

struct GradientBackgroundStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(LinearGradient(gradient: Gradient(colors: [Color("DarkGreen"), Color("LightGreen")]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(40)
            .padding(.horizontal, 20)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

struct RotationButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 80, height: 80)
            .background(.purple)
            .clipShape(Circle())
            .foregroundColor(.white)
            .font(.largeTitle)
            .fontWeight(.bold)
            .rotationEffect(configuration.isPressed ? .degrees(360) : .degrees(0))
    }
}
