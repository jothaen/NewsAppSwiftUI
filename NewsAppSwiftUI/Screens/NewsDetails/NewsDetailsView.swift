//
//  NewsDetailsView.swift
//  NewsAppSwiftUI
//
//  Created by Piotr Kozłowski on 19/11/2019.
//  Copyright © 2019 Piotr Kozłowski. All rights reserved.
//

import SwiftUI

struct NewsDetailsView : View {
    
    private let article: ArticleModel
    
    init(article: ArticleModel) {
        self.article = article
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            getImageView(url: article.getImageUrl())?.fullScreen()
            getTitle(title: article.title).bottomPadding(val: 8)
            getAuthor(author: article.author)
            getDate(date: article.publishedAt)?.bottomPadding(val: 12)
            getContent(content: article.content)?.bottomPadding(val: 12)
            getArticleUrl(url: article.getArticleUrl())?.onTapGesture {
                UrlHandler.openUrl(url: self.article.getArticleUrl())
            }
        }
        .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
        .fullScreen()
    }
    
    private func getImageView(url: URL?) -> NetworkImageView? {
        guard let url = url else { return nil }
        return NetworkImageView(url: url, height: 300, width: 300)
    }
    
    private func getTitle(title: String) -> Text {
        return Text(title).font(.title)
    }
    
    private func getAuthor(author: String?) -> Text? {
        guard let author = author else { return nil }
        return Text("author: \(author)").font(.subheadline)
    }
    
    private func getDate(date: String?) -> Text? {
        guard let date = date else { return nil }
        let readableDate = DateTimeFormatter.readableDate(dateString: date)
        return Text(readableDate).font(.footnote)
    }
    
    private func getContent(content: String?) -> Text? {
        guard let content = content else { return nil }
        return Text(content)
    }
    
    private func getArticleUrl(url: URL?) -> Text? {
        guard let url = url else { return nil }
        return Text(url.absoluteString).underline().foregroundColor(.blue)
    }
    
}

extension View {
    func bottomPadding(val: CGFloat) -> some View {
        self.padding(EdgeInsets(top: 0, leading: 0, bottom: val, trailing: 0))
    }
    
}
