//
//  CollectionViewCell.swift
//  Upli
//
//  Created by 王毅 on 15/5/11.
//  Copyright (c) 2015年 Ted. All rights reserved.
//

import UIKit

class MeCell: UICollectionViewCell {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var titleIco: UIImageView!
    @IBOutlet private weak var separatorViewHeightLayoutConstraint: NSLayoutConstraint!
    var me: Me? {
        didSet {
            if let me = me {
                titleLabel.text = me.title
                titleIco.image=me.titleico
            }
        }
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        separatorViewHeightLayoutConstraint.constant = 1
    }
    
}
