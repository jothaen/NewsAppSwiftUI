//
//  GetArticlesResponse.swift
//  NewsAppSwiftUI
//
//  Created by Piotr Kozłowski on 17/11/2019.
//  Copyright © 2019 Piotr Kozłowski. All rights reserved.
//

import Foundation

struct GetArticlesResponse : Codable {
    let status: String
    let totalResults: Int
    let articles: [ArticleModel]
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decode(String.self, forKey: .status)
        totalResults = try values.decode(Int.self, forKey: .totalResults)
        articles = try values.decode([ArticleModel].self, forKey: .articles)
    }
}
