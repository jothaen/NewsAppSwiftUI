//
//  SearchView.swift
//  NewsAppSwiftUI
//
//  Created by Piotr Kozłowski on 17/11/2019.
//  Copyright © 2019 Piotr Kozłowski. All rights reserved.
//

import SwiftUI

struct SearchView : View {
    private let SF_SYMBOLS_SEARCH_ICON = "magnifyingglass"
    
    @State var text: Binding<String>
    var hint: String
    var onCommit: () -> Void = { }

    var body: some View {
        HStack {
            Image(systemName: SF_SYMBOLS_SEARCH_ICON).padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 8))
            TextField(hint, text: text, onEditingChanged: { _ in }, onCommit: onCommit)
        }
        .background(Color.gray.opacity(0.1))
        .padding(EdgeInsets(top: 0, leading: 16.0, bottom: 0, trailing: 16.0))
    }
}
