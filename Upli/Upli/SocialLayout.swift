//
//  SocialLayout.swift
//  Upli
//
//  Created by Ted Hoyee on 5/11/15.
//  Copyright (c) 2015 Ted. All rights reserved.
//

import UIKit

protocol SocialLayoutDelegate {
    
    func collectionView(collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: NSIndexPath, withWidth width:CGFloat) -> CGFloat
    func collectionView(collectionView: UICollectionView, heightForIconAtIndexPath indexPath: NSIndexPath) -> CGFloat
    func collectionView(collectionView: UICollectionView, heightForCommentAtIndexPath indexPath: NSIndexPath, withWidth width:CGFloat) -> CGFloat
}

class socialLayoutAttribute: UICollectionViewLayoutAttributes {
    var iconHeight:CGFloat = 0.0
    var imageHeight:CGFloat = 0.0
    var commentHeight:CGFloat = 0.0
    var toolBarHeight:CGFloat = 0.0
    
    override func copyWithZone(zone: NSZone) -> AnyObject {
        let copy = super.copyWithZone(zone) as! socialLayoutAttribute
        
        copy.iconHeight = iconHeight
        copy.imageHeight = imageHeight
        copy.commentHeight = commentHeight
        copy.toolBarHeight = toolBarHeight
        
        
        return copy
    }
    
    override func isEqual(object: AnyObject?) -> Bool {
        if let attr = object as? socialLayoutAttribute {
            if attr.imageHeight == imageHeight {
                return super.isEqual(object)
            }
        }
        
        return false
    }
    
}


class SocialLayout: UICollectionViewLayout {
    
    var cellPadding: CGFloat = 0
    var delegate: SocialLayoutDelegate!
    var numberOfColumns = 1
    
    private var cache = [socialLayoutAttribute]()
    private var contentHeight: CGFloat = 0
    private var width: CGFloat {
        get {
            let insets = collectionView!.contentInset
            return CGRectGetWidth(collectionView!.bounds) - (insets.left + insets.right)
        }
    }
    
    override func collectionViewContentSize() -> CGSize {
        return CGSize(width: width, height: contentHeight)
    }
    
    override func prepareLayout() {
        if cache.isEmpty {
            let columnWidth:CGFloat = width / CGFloat(numberOfColumns)
            
            var xOffsets = [CGFloat]()
            for column in 0..<numberOfColumns {
                xOffsets.append(CGFloat(column) * columnWidth)
            }
            
            var yOffsets = [CGFloat](count: numberOfColumns, repeatedValue: 0)
            yOffsets = [6,68].join([[],yOffsets])
            
            var column = 0
            for item in 0..<collectionView!.numberOfItemsInSection(0) {
                let indexPath = NSIndexPath(forItem: item, inSection: 0)
                
                let imageHeight = delegate.collectionView(collectionView!, heightForPhotoAtIndexPath: indexPath, withWidth:columnWidth-cellPadding*2)
                let commentHeight = delegate.collectionView(collectionView!, heightForCommentAtIndexPath: indexPath, withWidth:columnWidth-cellPadding*2)
                let iconHeight = delegate.collectionView(collectionView!, heightForIconAtIndexPath: indexPath)
                
                let finalCellHeight = cellPadding * 2 + imageHeight + commentHeight + iconHeight + 30 //TODO:
                
                let frame = CGRect(x: xOffsets[column], y: yOffsets[column], width: columnWidth, height: finalCellHeight)
                let insetFrame = CGRectInset(frame, cellPadding, cellPadding)
                
                let attributes = socialLayoutAttribute(forCellWithIndexPath: indexPath)
                attributes.frame = insetFrame
                attributes.imageHeight = imageHeight
                attributes.iconHeight = iconHeight
                attributes.commentHeight = commentHeight
                
                cache.append(attributes)
                contentHeight = max(contentHeight, CGRectGetMaxY(frame))
                yOffsets[column] = yOffsets[column] + finalCellHeight
                column = column >= (numberOfColumns - 1) ? 0 : ++column
            }
        }
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [AnyObject]? {
        var layoutAttributes = [UICollectionViewLayoutAttributes]()
        for attributes in cache {
            if CGRectIntersectsRect(attributes.frame, rect) {
                layoutAttributes.append(attributes)
            }
        }
        return layoutAttributes
    }
    
}

