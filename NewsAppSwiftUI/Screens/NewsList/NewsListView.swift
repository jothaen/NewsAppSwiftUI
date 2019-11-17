//
//  ContentView.swift
//  NewsAppSwiftUI
//
//  Created by Piotr Kozłowski on 17/11/2019.
//  Copyright © 2019 Piotr Kozłowski. All rights reserved.
//

import SwiftUI

struct NewsListView: View {
    
    @EnvironmentObject var viewModel: NewsListViewModel
    
    var body: some View {
        Text("Hello, World!")
    }
}

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView()
    }
}
