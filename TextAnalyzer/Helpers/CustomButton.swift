//
//  CustomButton.swift
//  TextAnalyzer
//
//  Created by Francis Breidenbach on 12/18/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import UIKit

@IBDesignable class CustomButton: UIButton {
  
  @IBInspectable
  var cornerRadius: CGFloat = 0.0 {
    didSet {
      self.layer.cornerRadius = cornerRadius
    }
  }
  
}
