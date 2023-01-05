//
//  ContentView.swift
//  SwiftUIStacks
//
//  Created by Marble Interactive SL on 4/1/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HeaderView()
            PlansView()
            TeamPlan()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HeaderView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text("Choose")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.black)
            Text("Your Plan")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.black)
        }
        .padding()
    }
}

struct PricingView: View {
    
    var title: String
    var price: String
    var textColor: Color
    var bgColor: Color
    var icon: String?
    
    var body: some View {
        VStack {
            if let icon = icon {
                Image(systemName: icon)
                    .font(.system(size: 26))
                    .foregroundColor(textColor)
            }
            Text(title)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .foregroundColor(textColor)
            Text("$\(price)")
                .font(.system(size: 40, weight: .heavy, design: .rounded))
                .foregroundColor(textColor)
            Text("per month")
                .font(.headline)
                .foregroundColor(textColor)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
        .padding(40)
        .background(bgColor)
        .cornerRadius(10)
    }
}

struct PlansView: View {
    var body: some View {
        HStack(spacing: 16) {
            PricingView(
                title: "Basic",
                price: "9",
                textColor: .white,
                bgColor: .purple)
            
            ZStack {
                PricingView(
                    title: "Pro",
                    price: "19",
                    textColor: .black,
                    bgColor: Color(red: 240/255, green: 240/255, blue: 240/255))
                
                LabelBottom(
                    title: "Best for designer",
                    offSetX: 0,
                    offSetY: 87
                )
            }
        }
        .padding()
    }
}

struct TeamPlan: View {
    var body: some View {
        ZStack {
            PricingView(
                title: "Team",
                price: "299",
                textColor: .white,
                bgColor: .black.opacity(0.75),
                icon: "wand.and.rays"
            )
            LabelBottom(
                title: "Perfect for teams with 20 members",
                offSetX: 0,
                offSetY: 105
            )
        }
        .padding(.horizontal)
    }
}

struct LabelBottom: View {
    
    var title: String
    var offSetX: CGFloat
    var offSetY: CGFloat
    
    var body: some View {
        Text(title)
            .font(.system(.caption, design: .rounded))
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding(5)
            .background(Color(red: 255/255, green: 182/255, blue: 37/255))
            .offset(x: offSetX, y: offSetY)
    }
}
