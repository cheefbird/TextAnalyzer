//
//  Analysis.swift
//  TextAnalyzer
//
//  Created by Francis Breidenbach on 12/15/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import Foundation

protocol Analysis {
  var text: String { get set }
  var overall: Sentiment { get set }
  var sentences: [Sentiment] { get set }
}

