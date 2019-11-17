//
//  ResponseWrapper.swift
//  NewsAppSwiftUI
//
//  Created by Piotr Kozłowski on 17/11/2019.
//  Copyright © 2019 Piotr Kozłowski. All rights reserved.
//

import Foundation

struct ResponseWrapper<T> {
    var data: T
    var errorData: String?
    var state: ResponseState
}

enum ResponseState {
    case LOADING
    case SUCCESS
    case ERROR
}
