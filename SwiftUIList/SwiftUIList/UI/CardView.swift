//
//  SwiftUICardView.swift
//  SwiftUIList
//
//  Created by Marble Interactive SL on 11/1/23.
//

import SwiftUI

struct CardView: View {
    
    var image: String
    var category: String
    var heading: String
    var author: String
    var rate: Int
    var excerpt: String
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(image)
                .resizable()
                .frame(height: 250)
                .scaledToFit()
                .cornerRadius(10)
            
            Text(heading)
                .font(.system(.title, design: .rounded))
                .bold()
            Text("By \(author)")
                .font(.system(.callout, design: .rounded))
                .foregroundColor(.gray)
            StarRate(rate: rate)
            Text(excerpt)
                .font(.system(.body, design: .rounded))
                .foregroundColor(.gray)
        }
    }
}

struct StarRate: View {
    
    var rate: Int
    
    var body: some View {
        HStack {
            ForEach(0...rate, id: \.self) { _ in
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                    .frame(width: 15, height: 15)
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let article: Article = cardArticles[0]
        
        CardView(image: article.image, category: article.category, heading: article.heading, author: article.author, rate: article.rate, excerpt: article.excerpt)
    }
}
