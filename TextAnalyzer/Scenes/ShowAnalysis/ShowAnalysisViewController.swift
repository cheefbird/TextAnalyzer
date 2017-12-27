//
//  ShowAnalysisViewController.swift
//  TextAnalyzer
//
//  Created by Francis Breidenbach on 12/19/17.
//  Copyright (c) 2017 Francis Breidenbach. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ShowAnalysisDisplayLogic: class {
  func displayAnalysis(viewModel: ShowAnalysis.Something.ViewModel)
}

class ShowAnalysisViewController: UIViewController, ShowAnalysisDisplayLogic {
  var interactor: ShowAnalysisBusinessLogic?
  var router: (NSObjectProtocol & ShowAnalysisRoutingLogic & ShowAnalysisDataPassing)?
  
  // Outlets
  
  @IBOutlet var analysisLabel: UILabel!
  
  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup() {
    let viewController = self
    let interactor = ShowAnalysisInteractor()
    let presenter = ShowAnalysisPresenter()
    let router = ShowAnalysisRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Actions
  
  @IBAction func close() {
    dismiss(animated: true, completion: nil)
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    loadUI()
  }
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
  func loadUI() {
    let request = ShowAnalysis.Something.Request()
    interactor?.showProcessedAnalysis(request: request)
  }
  
  func displayAnalysis(viewModel: ShowAnalysis.Something.ViewModel) {
//    analysisLabel.text = viewModel.analysis as! String
    
    var stringResult = "Overall: \n"
    stringResult.append("Magnitude: \(String(viewModel.analysis.overall.magnitude))\n")
    stringResult.append("Score: \(String(viewModel.analysis.overall.score))\n\n")
    
    for sentiment in viewModel.analysis.sentences {
      stringResult.append("Sentence: \(sentiment.text!)\n")
      stringResult.append("Magnitude: \(sentiment.magnitude)\n")
      stringResult.append("Score: \(sentiment.score)\n\n")
    }
    
    analysisLabel.text = stringResult
  }
}
