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
    
    @Published var articles: ResponseWrapper<[ArticleModel]>
    
    init() {
        articles = ResponseWrapper<[ArticleModel]>(data: [], state: ResponseState.LOADING)
    }

    func search(forQuery searchQuery: String) {
        
        DispatchQueue.global(qos: .background).async{ [weak self] in
            self?.requestsHandler.getArticles(query: searchQuery, successHandler: { response in
                DispatchQueue.main.async {
                    guard let self = self else { return }
                    self.articles = ResponseWrapper<[ArticleModel]>(data: response.articles, state: ResponseState.SUCCESS)
                    print(response.status)
                    
                }
            }) { (error) in
                DispatchQueue.main.async {
                    self?.articles = ResponseWrapper<[ArticleModel]>(data: [], errorData: error, state: ResponseState.ERROR)
                }
            }
        }
        
    }
}
