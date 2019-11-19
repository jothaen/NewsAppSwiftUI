//
//  NewsListElement.swift
//  NewsAppSwiftUI
//
//  Created by Piotr Kozłowski on 17/11/2019.
//  Copyright © 2019 Piotr Kozłowski. All rights reserved.
//

import SwiftUI

struct NewsListElement : View {
    
    let article: ArticleModel
    
    var body: some View {
        NavigationLink(destination: NewsDetailsView(article: article)) {
            HStack(alignment: .top) {
                getImageView(url: article.getImageUrl())
                VStack(alignment: .leading) {
                    Text(article.title).font(.headline)
                    getAuthorText(author: article.author)
                    getFormattedDate(dateString: article.publishedAt)
                }
            }
        }
    }
    
    private func getFormattedDate(dateString: String?) -> Text? {
        guard let dateString = dateString else { return nil }
        let formattedDate = DateTimeFormatter.readableDate(dateString: dateString)
        return Text(formattedDate).font(.footnote)
    }
    
    private func getAuthorText(author: String?) -> Text? {
        guard let author = author else { return nil }
        return Text("author: \(author)").font(.subheadline)
    }
    
    private func getImageView(url: URL?) -> NetworkImageView? {
        guard let url = url else { return nil }
        return NetworkImageView(url: url, height: 100, width: 100)
    }
    
}

#if DEBUG
struct NewsListElement_Previews : PreviewProvider {
    static var previews: some View {
        NewsListElement(article: ArticleModel.mock())
    }
}
#endif
