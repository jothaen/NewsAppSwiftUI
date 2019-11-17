//
//  NewsListViewModel.swift
//  NewsAppSwiftUI
//
//  Created by Piotr Kozłowski on 17/11/2019.
//  Copyright © 2019 Piotr Kozłowski. All rights reserved.
//

import SwiftUI
import Combine

class NewsListViewModel : ObservableObject {
    
    private let requestsHandler = RequestsHandler()
    
    var articles: [ArticleModel] = [] {
        didSet {
            didChange.send(self)
        }
    }
    
    var didChange = PassthroughSubject<NewsListViewModel, Never>()
    
    init() {
        search(forQuery: "poland")
    }
    
    func search(forQuery searchQuery: String) {
        
        DispatchQueue.global(qos: .background).async{ [weak self] in
            self?.requestsHandler.getArticles(query: searchQuery, successHandler: { response in
                DispatchQueue.main.async {
                    guard let self = self else { return }
                    self.articles = response.articles
                }
            }) { (error) in
                DispatchQueue.main.async {
                    print(error)
                }
            }
        }
        
        
    }
}
