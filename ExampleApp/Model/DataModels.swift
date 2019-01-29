//
//  ArticleData.swift
//  ExampleApp
//
//  Created by Gevorgyan, Artak on 28/01/2019.
//  Copyright © 2019 Gevorgyan, Artak. All rights reserved.
//

import Foundation

struct ArticleInfoResponse: Codable {
    let articleInfo: ArticleInfo
    
    enum CodingKeys: String, CodingKey {
        case articleInfo = "response"
    }
}

struct ArticleInfo: Codable {
    let status: String
    let articleData: [ArticleData]
    
    enum CodingKeys: String, CodingKey {
        case articleData = "results"
        case status
    }
}

struct ArticleData: Codable {
    let details: ArticleDetails
    let type: String
    let webPublicationDate: String
    
    enum CodingKeys: String, CodingKey {
        case details = "fields"
        case type
        case webPublicationDate
    }
}

struct ArticleDetails: Codable {
    let headline: String
    let thumbnail: String
}
