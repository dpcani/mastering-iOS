//
//  ContentView.swift
//  SwiftUIShape
//
//  Created by Marble Interactive SL on 8/1/23.
//

import SwiftUI

struct ContentView: View {
    
    private var purpleGradient = LinearGradient(gradient: Gradient(colors: [Color(red: 207/255, green: 150/255, blue: 207/255), Color(red: 107/255, green: 116/255, blue: 179/255)]), startPoint: .trailing, endPoint: .leading)
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(Color(.systemGray6), lineWidth: 20)
                .frame(width: 300, height: 300)
            Circle()
                .trim(from: 0, to: 0.85)
                .stroke(purpleGradient, lineWidth: 20)
                .frame(width: 300, height: 300)
                .overlay {
                    VStack{
                        Text("85%")
                            .font(.system(size: 80, weight: .bold, design: .rounded))
                            .foregroundColor(.gray)
                        Text("Complete")
                            .font(.system(.body, design: .rounded))
                            .bold()
                            .foregroundColor(.gray)
                    }
                }
        }
    }
}

struct Dome: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: 0))
        path.addQuadCurve(to: CGPoint(x: rect.size.width, y: 0), control: CGPoint(x: rect.size.width/2, y: -(rect.size.width * 0.1)))
        path.addRect(CGRect(x: 0, y: 0, width: rect.size.width, height: rect.size.height))
        
        return path
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
