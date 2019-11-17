//
//  NewsListElement.swift
//  NewsAppSwiftUI
//
//  Created by Piotr Kozłowski on 17/11/2019.
//  Copyright © 2019 Piotr Kozłowski. All rights reserved.
//

import SwiftUI

struct NewsListElement : View {
    
    let article: ArticleModel
    
    var body: some View {
         Text(article.title)
    }
    
}

#if DEBUG
struct NewsListElement_Previews : PreviewProvider {
    static var previews: some View {
        NewsListElement(article: ArticleModel.mock())
    }
}
#endif
