//
//  ArticleModel.swift
//  NewsAppSwiftUI
//
//  Created by Piotr Kozłowski on 17/11/2019.
//  Copyright © 2019 Piotr Kozłowski. All rights reserved.
//

import Foundation

struct ArticleModel : Codable, Hashable {
    
    let author: String?
    let title: String
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        author = try values.decodeIfPresent(String.self, forKey: .author)
        title = try values.decodeIfPresent(String.self, forKey: .title) ?? "Title not available"
        description = try values.decodeIfPresent(String.self, forKey: .description)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        urlToImage = try values.decodeIfPresent(String.self, forKey: .urlToImage)
        publishedAt = try values.decodeIfPresent(String.self, forKey: .publishedAt)
        content = try values.decodeIfPresent(String.self, forKey: .content)
    }
    
    init(author: String?, title: String, description: String?, url: String?, urlToImage: String?, publishedAt: String?, content: String?) {
        self.author = author
        self.title = title
        self.description = description
        self.url = url
        self.urlToImage = urlToImage
        self.publishedAt = publishedAt
        self.content = content
    }
    
    func getImageUrl() -> URL? {
        return getUrlFromString(urlString: urlToImage)
    }
    
    func getArticleUrl() -> URL? {
        return getUrlFromString(urlString: url)
    }
    
    private func getUrlFromString(urlString: String?) -> URL? {
    guard let urlString = urlString else { return nil }
        return URL(string: urlString)
    }
    
    static func mock() -> ArticleModel {
        return ArticleModel(author: "John Doe", title: "Title", description: "Description", url: "www.google.pl", urlToImage: "www.google.pl", publishedAt: "17-11-2019", content: "Content")
    }
    
}
