//
//  SwiftUIArticleDetailView.swift
//  SwiftUINavigationList
//
//  Created by Marble Interactive SL on 12/1/23.
//

import SwiftUI

struct ArticleDetailView: View {
    let article: Article
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image(article.image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                Group {
                    Text(article.title)
                        .font(.system(.title, design: .rounded))
                        .bold()
                        .padding(.horizontal)
                    Text("By \(article.author)".uppercased())
                        .font(.system(.body, design: .rounded))
                        .bold()
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                }
                .padding(.bottom, 0)
                .padding(.horizontal)
                Text(article.excerpt)
                    .font(.system(.body, design: .rounded))
                    .padding()
                    .lineLimit(1000)
                    .multilineTextAlignment(.leading)
                Spacer()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ArticleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let article = articles[0]
        NavigationStack {
            ArticleDetailView(article: article)
        }
        .navigationTitle("Article")
    }
}
