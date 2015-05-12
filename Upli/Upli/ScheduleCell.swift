//
//  CollectionViewCell.swift
//  Upli
//
//  Created by 王毅 on 15/5/11.
//  Copyright (c) 2015年 Ted. All rights reserved.
//

import UIKit

class ScheduleCell: UICollectionViewCell {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var titleIco: UIImageView!
    @IBOutlet private weak var separatorViewHeightLayoutConstraint: NSLayoutConstraint!
    var session: Session? {
        didSet {
            if let session = session {
                titleLabel.text = session.title
                titleIco.image=session.titleico
            }
        }
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        separatorViewHeightLayoutConstraint.constant = 1
    }
    
}
