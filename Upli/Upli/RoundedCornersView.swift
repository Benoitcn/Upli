//
//  RoundedCornersView.swift
//  Upli
//
//  Created by Ted Hoyee on 5/11/15.
//  Copyright (c) 2015 Ted. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedCornersView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
}