//
//  NetworkSentiment.swift
//  TextAnalyzer
//
//  Created by Francis Breidenbach on 12/15/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import Foundation
import SwiftyJSON

struct NetworkSentiment: Sentiment {
  
  // Properties
  var magnitude: Float
  var score: Float
  var text: String?
  
  // Init
  init(forOverall json: JSON) {
    magnitude = json["documentSentiment"]["magnitude"].floatValue
    score = json["documentSentiment"]["score"].floatValue
  }
  
  init(forSentence json: JSON) {
    magnitude = json["sentiment"]["magnitude"].floatValue
    score = json["sentiment"]["score"].floatValue
    
    text = json["text"]["content"].stringValue
  }
}
