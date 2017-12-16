//
//  ViewController.swift
//  TextAnalyzer
//
//  Created by Francis Breidenbach on 12/15/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
  
  let testText = "The food was awful. I will never go again."

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    GAClientManager.shared.fetchSentiment(forText: testText) { result in
      print(result.value)
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

