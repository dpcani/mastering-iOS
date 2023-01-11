//
//  SwiftUIReaderList.swift
//  SwiftUIList
//
//  Created by Marble Interactive SL on 11/1/23.
//

import SwiftUI

struct SwiftUIReaderList: View {
    
    let articles: [Article] = cardArticles
    
    var body: some View {
        List(articles) { article in
            CardView(
                image: article.image,
                category: article.category,
                heading: article.heading,
                author: article.author,
                rate: article.rate,
                excerpt: article.excerpt)
        }
        .listStyle(.plain)
    }
}

struct SwiftUIReaderList_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIReaderList()
    }
}
