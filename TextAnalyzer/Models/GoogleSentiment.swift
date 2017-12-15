//
//  GoogleSentiment.swift
//  TextAnalyzer
//
//  Created by Francis Breidenbach on 12/15/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import Foundation

struct GoogleSentiment: Sentiment {
  var magnitude: Float
  
  var score: Float
  
  var text: String
}
