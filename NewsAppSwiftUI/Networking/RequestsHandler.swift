//
//  RequestsHandler.swift
//  NewsAppSwiftUI
//
//  Created by Piotr Kozłowski on 17/11/2019.
//  Copyright © 2019 Piotr Kozłowski. All rights reserved.
//


import Foundation

typealias NetworkCompletionHandler = (Data?, URLResponse?, Error?) -> Void
typealias ErrorHandler = (String) -> Void

class RequestsHandler {
    private let BASE_URL = "https://newsapi.org/v2"
    private let EVERYTHING_ENDPOINT = "/everything"
    private let API_KEY = "7fa6727ed50442d48236c75e4f3e705c"
    
    static let genericError = "Something went wrong. Please try again later"
    
    func getArticles(query: String, successHandler: @escaping (GetArticlesResponse) -> Void, errorHandler: @escaping ErrorHandler) {
        let urlString = "\(BASE_URL)\(EVERYTHING_ENDPOINT)?q=\(query)&apiKey=\(API_KEY)"
        guard let url = URL(string: urlString) else {
            assertionFailure("Failure while constructing url")
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        get(urlRequest: urlRequest, successHandler: successHandler, errorHandler: errorHandler)
    }
    
    private func get<T: Codable>(urlRequest: URLRequest,successHandler: @escaping (T) -> Void, errorHandler: @escaping ErrorHandler) {
        
        let completionHandler: NetworkCompletionHandler = { (data, urlResponse, error)  in
            if let error = error {
                print(error.localizedDescription)
                errorHandler(RequestsHandler.genericError)
                return
            }
            
            if urlResponse.isSuccessful() {
                guard let data = data else {
                    print("Unable to parse the response in given type \(T.self)")
                    return errorHandler(RequestsHandler.genericError)
                }
                
                if let responseObject = try? JSONDecoder().decode(T.self, from: data) {
                    successHandler(responseObject)
                    return
                }
            }
            
            errorHandler(RequestsHandler.genericError)
        }
        
        URLSession.shared.dataTask(with: urlRequest, completionHandler: completionHandler).resume()
    }
}

private extension Optional where Wrapped == URLResponse {
    func isSuccessful() -> Bool {
        guard let urlResponse = self as? HTTPURLResponse else {
            return false
        }
        return isSuccessCode(urlResponse.statusCode)
    }
    
    private func isSuccessCode(_ statusCode: Int) -> Bool {
        return statusCode >= 200 && statusCode < 300
    }
}

