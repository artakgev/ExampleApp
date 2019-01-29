//
//  ArticlesTableViewModel.swift
//  ExampleApp
//
//  Created by Gevorgyan, Artak on 28/01/2019.
//  Copyright © 2019 Gevorgyan, Artak. All rights reserved.
//

import UIKit

struct ArticlesTableViewModel {
    
    // MARK: - Properties
    
    let articlesData: [ArticleData]
    
    // MARK: - Public methods

    func articleData(for index: Int) -> ArticleData {
        let article = articlesData[index]
        return article
    }
    
    func articleTitle(for index: Int) -> String {
        let article = articlesData[index]
        return article.details.headline
    }
    
    func articleDate(for index: Int) -> String {
        let article = articlesData[index]
        return article.webPublicationDate
    }
    
    func articleThumbnailURL(for index: Int) -> URL {
        let article = articlesData[index]
        guard let url = URL(string: article.details.thumbnail) else {
            fatalError("Empty URL: \(article.details.thumbnail)")
        }
        return url
    }

    
}

