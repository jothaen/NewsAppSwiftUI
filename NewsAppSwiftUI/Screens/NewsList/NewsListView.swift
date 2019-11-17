//
//  ContentView.swift
//  NewsAppSwiftUI
//
//  Created by Piotr Kozłowski on 17/11/2019.
//  Copyright © 2019 Piotr Kozłowski. All rights reserved.
//

import SwiftUI

struct NewsListView: View {
    
    @State private var query = "Cracow"
    @EnvironmentObject var viewModel: NewsListViewModel
    
    var body: some View {
         NavigationView {
            VStack {
                SearchView(text: $query, hint: Constants.SEARCH_FOR_ARTICLES_TEXT, onCommit: search)
                getContent().fullScreen()
            }
            .navigationBarTitle(Constants.APP_NAME)
        }
         .onAppear(perform: search)
    }
    
    private func getContent() -> AnyView {
        switch viewModel.articles.state {
            case .LOADING:
                return AnyView(Text(Constants.LOADING_TEXT))
            case .ERROR:
                let errorMsg = viewModel.articles.errorData ?? Constants.GENERIC_ERROR_MESSAGE
                return AnyView(ErrorView(errorMessage: errorMsg, onRetryClick: search))
            case .SUCCESS:
                if (viewModel.articles.data.isEmpty) { return AnyView(getEmptyResultsView()) }
                return AnyView(getArticlesList(data: viewModel.articles.data))
        }
    }
    
    private func getEmptyResultsView() -> some View {
        return Text(Constants.SEARCH_EMPTY_STATE)
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

extension View {
    func fullScreen() -> some View {
        return frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    }
}

#if DEBUG
struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView()
    }
}
#endif
