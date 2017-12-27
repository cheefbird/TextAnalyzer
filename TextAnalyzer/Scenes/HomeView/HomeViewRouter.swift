//
//  HomeViewRouter.swift
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

@objc protocol HomeViewRoutingLogic {
  func routeToShowAnalysis(segue: UIStoryboardSegue?)
}

protocol HomeViewDataPassing {
  var dataStore: HomeViewDataStore? { get }
}

class HomeViewRouter: NSObject, HomeViewRoutingLogic, HomeViewDataPassing {
  weak var viewController: HomeViewViewController?
  var dataStore: HomeViewDataStore?
  
  // MARK: Routing
  
  func routeToShowAnalysis(segue: UIStoryboardSegue?) {

    if let segue = segue {
      let destinationVC = segue.destination as! ShowAnalysisViewController
      var destinationDS = destinationVC.router!.dataStore!
      passDataToShowAnalysis(source: dataStore!, destination: &destinationDS)
    } else {
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      let destinationVC = storyboard.instantiateViewController(withIdentifier: "ShowAnalysisVC") as! ShowAnalysisViewController
      var destinationDS = destinationVC.router!.dataStore!
      passDataToShowAnalysis(source: dataStore!, destination: &destinationDS)
      navigateToSomewhere(source: viewController!, destination: destinationVC)
    }
  }
  
//  func routeToSomewhere(segue: UIStoryboardSegue?) {
//    if let segue = segue {
//      let destinationVC = segue.destination as! SomewhereViewController
//      var destinationDS = destinationVC.router!.dataStore!
//      passDataToSomewhere(source: dataStore!, destination: &destinationDS)
//    } else {
//      let storyboard = UIStoryboard(name: "Main", bundle: nil)
//      let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
//      var destinationDS = destinationVC.router!.dataStore!
//      passDataToSomewhere(source: dataStore!, destination: &destinationDS)
//      navigateToSomewhere(source: viewController!, destination: destinationVC)
//    }
//  }

  // MARK: Navigation
  
  func navigateToSomewhere(source: HomeViewViewController, destination: ShowAnalysisViewController) {
    source.show(destination, sender: nil)
  }
  
  // MARK: Passing data
  
  func passDataToShowAnalysis(source: HomeViewDataStore, destination: inout ShowAnalysisDataStore) {
    destination.analysis = source.analysis
  }
}
