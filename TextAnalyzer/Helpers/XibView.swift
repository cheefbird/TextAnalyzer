//
//  XibView.swift
//  TextAnalyzer
//
//  Created by Francis Breidenbach on 1/16/18.
//  Copyright © 2018 Francis Breidenbach. All rights reserved.
//

import UIKit

@IBDesignable
class XibView: UIView {
  
  // MARK: - Properties
  
  var contentView: UIView?
  @IBInspectable var nibName: String?
  
  // MARK: - Init
  
  override func prepareForInterfaceBuilder() {
    super.prepareForInterfaceBuilder()
    
    xibSetup()
    
    contentView?.prepareForInterfaceBuilder()
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    xibSetup()
  }
  
  func xibSetup() {
    guard let view = loadViewFromNib() else { return }
    
    view.frame = bounds
    view.autoresizingMask = [
      .flexibleWidth,
      .flexibleHeight
    ]
    
    addSubview(view)
    contentView = view
  }
  
  func loadViewFromNib() -> UIView? {
    guard let nibName = nibName else { return nil }
    let bundle = Bundle(for: type(of: self))
    
    let nib = UINib(nibName: nibName, bundle: bundle)
    
    return nib.instantiate(withOwner: self, options: nil).first as? UIView
  }
  
}
