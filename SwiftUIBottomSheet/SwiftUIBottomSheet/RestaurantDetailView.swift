//
//  RestaurantDetailView.swift
//  SwiftUIBottomSheet
//
//  Created by Marble Interactive SL on 24/1/23.
//

import SwiftUI

struct RestaurantDetailView: View {
    let restaurant: Restaurant
    
    var body: some View {
        VStack {
            Spacer()
            
            HandleBar()
            
            ScrollView(.vertical) {
                TitleBar()
                
                HeaderView(restaurant: self.restaurant)
                
                DetailInfoView(icon: "map", info: self.restaurant.location)
                    .padding(.top)
                DetailInfoView(icon: "phone", info: self.restaurant.phone)
                DetailInfoView(icon: nil, info: self.restaurant.description)
                    .padding(.top)
            }
            .background(Color.white)
            .cornerRadius(10, antialiased: true)
        }

    }
}

struct RestaurantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetailView(restaurant: restaurants[0])
    }
}

struct HandleBar: View {
    
    var body: some View {
        Rectangle()
            .frame(width: 50, height: 5)
            .foregroundColor(Color(.systemGray5))
            .cornerRadius(10)
    }
}

struct TitleBar: View {
    
    var body: some View {
        HStack {
            Text("Restaurant Details")
                .font(.headline)
                .foregroundColor(.primary)
            
            Spacer()
        }
        .padding()
    }
}

struct HeaderView: View {
    let restaurant: Restaurant
    
    var body: some View {
        Image(restaurant.image)
            .resizable()
            .scaledToFill()
            .frame(height: 300)
            .clipped()
            .overlay(
                HStack {
                    VStack(alignment: .leading) {
                        Spacer()
                        Text(restaurant.name)
                            .foregroundColor(.white)
                            .font(.system(.largeTitle, design: .rounded))
                            .bold()
                        
                        Text(restaurant.type)
                            .font(.system(.headline, design: .rounded))
                            .padding(5)
                            .foregroundColor(.white)
                            .background(Color.red)
                            .cornerRadius(5)
                        
                    }
                    Spacer()
                }
                    .padding()
            )
    }
}

struct DetailInfoView: View {
    let icon: String?
    let info: String
    
    var body: some View  {
        HStack {
            if icon != nil {
                Image(systemName: icon!)
                    .padding(.trailing, 10)
            }
            Text(info)
                .font(.system(.body, design: .rounded))
            
            Spacer()
        }.padding(.horizontal)
    }
}
