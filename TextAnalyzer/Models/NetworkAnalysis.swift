//
//  NetworkAnalysis.swift
//  TextAnalyzer
//
//  Created by Francis Breidenbach on 12/15/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import Foundation

struct NetworkAnalysis: Analysis {
  var overall: Sentiment
  var sentences: [Sentiment]
}
