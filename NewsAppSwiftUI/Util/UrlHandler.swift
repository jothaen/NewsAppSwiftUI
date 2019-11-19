//
//  UrlHandler.swift
//  NewsAppSwiftUI
//
//  Created by Piotr Kozłowski on 19/11/2019.
//  Copyright © 2019 Piotr Kozłowski. All rights reserved.
//


import SwiftUI

class UrlHandler {
    
    static func openUrl(url: URL?) {
    guard let url = url else { return }
        UIApplication.shared.open(url)
    }
    
}
