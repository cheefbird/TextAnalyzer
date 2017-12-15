//
//  Sentiment.swift
//  TextAnalyzer
//
//  Created by Francis Breidenbach on 12/15/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import Foundation

protocol Sentiment {
  var magnitude: Float { get set }
  var score: Float { get set }
  var text: String { get set }
}
