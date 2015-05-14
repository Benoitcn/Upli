//
//  SetUpProfileStep2Cell.swift
//  Upli
//
//  Created by 王毅 on 15/5/14.
//  Copyright (c) 2015年 Ted. All rights reserved.
//

import UIKit

class SetUpProfileStep2Cell: UICollectionViewCell {
    @IBOutlet private weak var ImgItem:UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var separatorViewHeightLayoutConstraint: NSLayoutConstraint!
    var PickerItem:NSArray = []
    var setUpProfileStep2: SetUpProfileStep2? {
        didSet {
            if let setUpProfileStep2 = setUpProfileStep2 {
                titleLabel.text = setUpProfileStep2.titleLabel
                ImgItem.image=setUpProfileStep2.Bg
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    //separatorViewHeightLayoutConstraint.constant = 1
    }
}
