//
//  DataManager.swift
//  ExampleApp
//
//  Created by Gevorgyan, Artak on 28/01/2019.
//  Copyright © 2019 Gevorgyan, Artak. All rights reserved.
//

import Foundation
import Alamofire

enum DataManagerError: Error {
    case unknown
    case failedRequest
    case invalidResponse
}

final class DataManager {
    
    typealias ArticleDataCompletion = ([ArticleData]?, DataManagerError?) -> ()

    // MARK: - Public methods

    func fetchArticles(completion: @escaping ArticleDataCompletion) {
        Alamofire.request(API.BaseURL,
                   parameters: ["api-key": API.APIKey,
                                "show-fields" : "thumbnail,headline"])
            .validate()
            .responseJSON { response in
                guard let data = response.data else {
                    completion(nil, .failedRequest)
                    return
                }
                do {
                    let jsonDecoder = JSONDecoder()
                    let articleInfoResponse: ArticleInfoResponse = try jsonDecoder.decode(ArticleInfoResponse.self, from: data)
                    print(articleInfoResponse)
                    completion(articleInfoResponse.articleInfo.articleData, nil)
                } catch DecodingError.dataCorrupted(let context) {
                    print(context.debugDescription)
                    completion(nil, .invalidResponse)
                } catch DecodingError.keyNotFound(let key, let context) {
                    print("Key '\(key)' not Found")
                    print("Debug Description:", context.debugDescription)
                    completion(nil, .invalidResponse)
                } catch DecodingError.valueNotFound(let value, let context) {
                    print("Value '\(value)' not Found")
                    print("Debug Description:", context.debugDescription)
                    completion(nil, .invalidResponse)
                } catch DecodingError.typeMismatch(let type, let context)  {
                    print("Type '\(type)' mismatch")
                    print("Debug Description:", context.debugDescription)
                    completion(nil, .invalidResponse)
                } catch {
                    print("error: ", error)
                    completion(nil, .invalidResponse)
                }
        }
    }
}

