//
//  GAClientManager.swift
//  TextAnalyzer
//
//  Created by Francis Breidenbach on 12/15/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class GAClientManager {
  
  // Singleton
  static let shared = GAClientManager()
  
  private init() { }
  
  // Methods
  
  func fetchSentiment(forText text: String, completionHandler: @escaping (Result<Analysis>) -> Void) {
    Alamofire.request(Router.analyze(text))
      .responseJSON { response in
        let result = self.parseAnalysis(from: response)
        completionHandler(result)
    }
  }
  
  func parseAnalysis(from response: DataResponse<Any>) -> Result<Analysis> {
    guard response.result.error == nil else {
      print(response.result.error!)
      return .failure(GAClientManagerError.invalidRequest)
    }
    
    guard let result = response.result.value as? [String: Any],
      let sentences = result["sentences"] as? [[String: Any]] else {
        print("RESULT: \(response.result.value!)")
        print("Unable to parse result value into JSON")
        return .failure(GAClientManagerError.responseSerializationError)
    }
    
    let resultJSON = JSON(result)
    
    let documentSentiment = NetworkSentiment(forOverall: resultJSON)
    var allSentences = [NetworkSentiment]()
    
    for sentence in sentences {
      let newJSON = JSON(sentence)
      let analyzedSentence = NetworkSentiment(forSentence: newJSON)
      
      allSentences.append(analyzedSentence)
    }
    
    let finalAnalysis = NetworkAnalysis(overall: documentSentiment, sentences: allSentences)
    
    return .success(finalAnalysis)
  }
}
