//
//  AnnotatedPhotoCell.swift
//  Upli
//
//  Created by Ted Hoyee on 5/11/15.
//  Copyright (c) 2015 Ted. All rights reserved.
//

import UIKit

class AnnotatedPhotoCell: UICollectionViewCell {
    
    @IBOutlet private weak var iconImage: UIImageView!
    @IBOutlet private weak var userName: UILabel!
    @IBOutlet private weak var timeFrameLabel: UILabel!
    @IBOutlet private weak var annotationTextView:UITextView!
    
    @IBOutlet private weak var imageView: UIImageView!
    
    @IBOutlet private weak var imageViewHeightLayoutConstraint: NSLayoutConstraint!
    @IBOutlet private weak var annotationViewHeightLayoutConstraint: NSLayoutConstraint!
    
    
    var photo: Photo? {
        didSet {
            if let photo = photo {
                imageView.image = photo.image
                userName.text = photo.caption
                iconImage.image = photo.icon
                annotationTextView.text = photo.comment
                
                timeFrameLabel.text = "22 min age"
                
                annotationTextView.scrollEnabled = false
                
            }
        }
    }
    
    override func applyLayoutAttributes(layoutAttributes: UICollectionViewLayoutAttributes!) {
        super.applyLayoutAttributes(layoutAttributes)
        
        let attr = layoutAttributes as! socialLayoutAttribute
        
        imageViewHeightLayoutConstraint.constant = attr.imageHeight
        annotationViewHeightLayoutConstraint.constant = attr.commentHeight
        
        println("image view height:\(attr.imageHeight)")
        
    }
}
