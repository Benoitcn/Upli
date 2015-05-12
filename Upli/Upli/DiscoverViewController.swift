//
//  DiscoverViewController.swift
//  Upli
//
//  Created by Ted Hoyee on 5/11/15.
//  Copyright (c) 2015 Ted. All rights reserved.
//

import AVFoundation
import UIKit

class DiscoverViewController: UICollectionViewController {
    var photos = Photo.allPhotos()
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView!.contentInset = UIEdgeInsets(top: 23, left: 5, bottom: 10, right: 5)
        
        let layout = collectionViewLayout as! SocialLayout
        layout.cellPadding = 5
        layout.delegate = self
        layout.numberOfColumns = 2
        
    }
    
}

extension DiscoverViewController {
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("AnnotatedPhotoCell", forIndexPath: indexPath) as! AnnotatedPhotoCell
        cell.photo = photos[indexPath.item] as Photo
        return cell
    }
    
}

extension DiscoverViewController: SocialLayoutDelegate {
    
    func collectionView(collectionView: UICollectionView, heightForIconAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 35.0
    }
    
    func collectionView(collectionView: UICollectionView, heightForCommentAtIndexPath indexPath: NSIndexPath, withWidth width:CGFloat) -> CGFloat {
        let photo = photos[indexPath.item] as Photo
        let comment:NSString = photo.comment as NSString
        var paragraphStyle:NSMutableParagraphStyle = NSMutableParagraphStyle()
        
        paragraphStyle.lineBreakMode = NSLineBreakMode.ByWordWrapping
        paragraphStyle.lineSpacing = 2.0
        paragraphStyle.lineHeightMultiple = 0
        
        let constraintSize = CGSizeMake(width, CGFloat(CGFloat.max))
        let stringDrawOptions = NSStringDrawingOptions.UsesFontLeading | NSStringDrawingOptions.UsesLineFragmentOrigin
        let measuredRect = comment.boundingRectWithSize(constraintSize, options: stringDrawOptions, attributes: [NSFontAttributeName:UIFont.systemFontOfSize(15.0), NSParagraphStyleAttributeName:paragraphStyle], context: nil)
        
        return measuredRect.size.height
    }
    
    func collectionView(collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: NSIndexPath, withWidth width:CGFloat) -> CGFloat {
        let photo = photos[indexPath.item] as Photo
        
        let boundingRect = CGRectMake(0, 0, width, CGFloat(CGFloat.max))
        
        let rect = AVMakeRectWithAspectRatioInsideRect(photo.image.size, boundingRect)
        
        let heightOfPhoto = CGRectGetHeight(rect)
        
        return heightOfPhoto
    }
    
}

