//
//  Router.swift
//  TextAnalyzer
//
//  Created by Francis Breidenbach on 12/15/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import Foundation
import Alamofire

enum Router {
  
  // Use cases
  case analyze(String)
  
  // Route Properties
  var method: HTTPMethod {
    switch self {
    case .analyze:
      return .post
    }
  }
  
  var baseURL: URL? {
    guard let path = Bundle.main.url(forResource: "Secured", withExtension: "plist"),
      let dictionaryList = NSDictionary(contentsOf: path) as? [String: String],
      let key = dictionaryList["apiKey"] else {
        return nil
    }
    
    return URL(string: "https://language.googleapis.com/v1/documents:analyzeSentiment?key=\(key)") ?? nil
  }
  
  var parameters: Parameters {
    switch self {
    case .analyze(let text):
      return postParameters(text: text)
    }
  }
  
  private func postParameters(text: String) -> Parameters {
    return [
      "encodingType": "UTF8",
      "document": [
        "type": "PLAIN_TEXT",
        "content": "\(text)"
      ]
    ]
  }
}

extension Router: URLRequestConvertible {
  
  func asURLRequest() throws -> URLRequest {
    // TODO: Handle/Throw errors
    guard let path = baseURL else {
      throw RouterError.baseURLConversionFailed
    }
    
    do {
      let request = try URLRequest(url: path, method: method)
      print(request)
      print(request.httpBody)
      
      let encoding = JSONEncoding.default
      
      let encodedRequest = try encoding.encode(request, with: parameters)
      
      return encodedRequest
    } catch let error {
      print(error.localizedDescription)
      throw error
    }
  }
  
}
