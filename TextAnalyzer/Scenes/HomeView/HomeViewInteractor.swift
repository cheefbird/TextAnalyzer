//
//  HomeViewInteractor.swift
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

protocol HomeViewBusinessLogic {
  func analyzeSentiment(request: HomeView.AnalyzeText.Request)
}

protocol HomeViewDataStore {
  //var name: String { get set }
  var analysis: Analysis? { get set }
}

class HomeViewInteractor: HomeViewBusinessLogic, HomeViewDataStore {
  var presenter: HomeViewPresentationLogic?
  var analysis: Analysis?
  
  // MARK: Do something
  
  func analyzeSentiment(request: HomeView.AnalyzeText.Request) {
    GAClientManager.shared.fetchAnalysis(forText: request.text) { result in
      guard result.isSuccess, let analysis = result.value else {
        print("FAIL: Text analysis failed")
        return
      }
      
      self.analysis = analysis
      
      let response = HomeView.AnalyzeText.Response(analysis: analysis)
      self.presenter?.presentAnalysis(response: response)
    }
  }
}
