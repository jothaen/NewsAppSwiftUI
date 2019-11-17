//
//  ContentView.swift
//  NewsAppSwiftUI
//
//  Created by Piotr Kozłowski on 17/11/2019.
//  Copyright © 2019 Piotr Kozłowski. All rights reserved.
//

import SwiftUI

struct NewsListView: View {
    
    @State private var query = "Poland"
    @EnvironmentObject var viewModel: NewsListViewModel
    
    var body: some View {
         NavigationView {
            return getContent()
        }.onAppear(perform: search)
    }
    
    private func getContent() -> AnyView {
        switch viewModel.articles.state {
            case .LOADING:
                return AnyView(Text(Constants.LOADING_TEXT))
            case .ERROR:
                let errorMsg = viewModel.articles.errorData ?? Constants.GENERIC_ERROR_MESSAGE
                return AnyView(Text(errorMsg))
            case .SUCCESS:
                return AnyView(getArticlesList(data: viewModel.articles.data))
        }
    }
    
    private func getArticlesList(data: [ArticleModel]) -> some View {
         return List(data, id: \.title) { item in
            NewsListElement(article: item)
         }
    }
    
    private func search() {
        viewModel.search(forQuery: query)
    }
}

#if DEBUG
struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView()
    }
}
#endif
