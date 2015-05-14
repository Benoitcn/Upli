//
//  FootView.swift
//  Upli
//
//  Created by 王毅 on 15/5/14.
//  Copyright (c) 2015年 Ted. All rights reserved.
//

import UIKit

class FooterView: UICollectionReusableView {
    @IBOutlet private weak var backgroundImageView: UIView!
    @IBOutlet private weak var backgroundImageViewHeightConstraint:NSLayoutConstraint!
    @IBOutlet private weak var btNext:UIButton!
    var backgroundImageHeight:CGFloat = 0.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        btNext.layer.cornerRadius=5
        backgroundImageHeight = backgroundImageViewHeightConstraint.constant
    }
    override func applyLayoutAttributes(layoutAttributes: UICollectionViewLayoutAttributes!) {
        super.applyLayoutAttributes(layoutAttributes)
        
        if let attr:collectionViewAttribute = layoutAttributes as? collectionViewAttribute {
            backgroundImageViewHeightConstraint.constant = backgroundImageHeight - attr.deltaY
        }
    }

}
