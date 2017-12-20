//
//  HomeViewModels.swift
//  TextAnalyzer
//
//  Created by Francis Breidenbach on 12/18/17.
//  Copyright (c) 2017 Francis Breidenbach. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum HomeView {
  // MARK: Use cases
  
  enum AnalyzeText {
    struct Request {
      var text: String
    }
    struct Response {
      var analysis: Analysis
    }
    struct ViewModel {
      var analysis: Analysis
    }
  }
}
