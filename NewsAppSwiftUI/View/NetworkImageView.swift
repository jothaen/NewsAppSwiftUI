//
//  NetworkImageView.swift
//  NewsAppSwiftUI
//
//  Created by Piotr Kozłowski on 17/11/2019.
//  Copyright © 2019 Piotr Kozłowski. All rights reserved.
//

import SwiftUI
import Combine

struct NetworkImageView: View {
    @ObservedObject var imageLoader: ImageLoader
    
    private let height: CGFloat
    private let width: CGFloat
    
    init(url: URL, height: CGFloat, width: CGFloat) {
        self.height = height
        self.width = width
        imageLoader = ImageLoader(url: url)
    }
    
    var body: some View {
        ZStack {
            if imageLoader.image != nil {
                Image(uiImage: imageLoader.image!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: width, height: height)
            } else {
                EmptyView().frame(width: width, height: height)
            }
        }
        .onAppear(perform: imageLoader.load)
        .onDisappear(perform: imageLoader.cancel)
    }
}

final class ImageLoader: ObservableObject {
    enum ImageLoadingError: Error {
        case incorrectData
    }

    @Published private(set) var image: UIImage? = nil
    
    private let url: URL
    private var cancellable: AnyCancellable?
    
    init(url: URL) {
        self.url = url
    }
    
    deinit {
        cancellable?.cancel()
    }
    
    func load() {
        cancellable = URLSession
            .shared
            .dataTaskPublisher(for: url)
            .tryMap { data, _ in
                guard let image = UIImage(data: data) else {
                    throw ImageLoadingError.incorrectData
                }
                
                return image
            }
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { [weak self] image in
                    self?.image = image
                }
            )
    }
    
    func cancel() {
        cancellable?.cancel()
    }
}
