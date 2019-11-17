//
//  QueryNormalizer.swift
//  NewsAppSwiftUI
//
//  Created by Piotr Kozłowski on 17/11/2019.
//  Copyright © 2019 Piotr Kozłowski. All rights reserved.
//

import Foundation

class QueryNormalizer {
    private static let URL_REPLACEMENT_FOR_WHITESPACE = "%20"
    private static let WHITESPACE = " "
    
    static func normalize(query: String) -> String {
        return query
            .folding(options: .diacriticInsensitive, locale: .current)
            .replacingOccurrences(of: WHITESPACE, with: URL_REPLACEMENT_FOR_WHITESPACE)
    }
}
