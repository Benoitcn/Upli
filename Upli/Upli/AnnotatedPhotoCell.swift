//
//  AnnotatedPhotoCell.swift
//  Upli
//
//  Created by Ted Hoyee on 5/11/15.
//  Copyright (c) 2015 Ted. All rights reserved.
//

import UIKit

class AnnotatedPhotoCell: UICollectionViewCell {
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var imageViewHeightLayoutConstraint: NSLayoutConstraint!
    
    var photo: Photo? {
        didSet {
            if let photo = photo {
                imageView.image = photo.image
            }
        }
    }
    
}
