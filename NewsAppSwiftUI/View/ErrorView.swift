//
//  ErrorView.swift
//  NewsAppSwiftUI
//
//  Created by Piotr Kozłowski on 17/11/2019.
//  Copyright © 2019 Piotr Kozłowski. All rights reserved.
//

import SwiftUI

struct ErrorView : View {
    
    let errorMessage: String
    let onRetryClick: () -> Void
    
    var body: some View {
         VStack {
            Text(errorMessage)
            Button(action: onRetryClick) {
                Text(Constants.TRY_AGAIN_TEXT)
            }
        }
    }
    
}
