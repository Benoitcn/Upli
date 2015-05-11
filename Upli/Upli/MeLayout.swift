//
//  MeLayout.swift
//  Upli
//
//  Created by 王毅 on 15/5/11.
//  Copyright (c) 2015年 Ted. All rights reserved.
//
import UIKit

class collectionViewAttribute: UICollectionViewLayoutAttributes {
    var deltaY:CGFloat = 0
    
    override func copyWithZone(zone: NSZone) -> AnyObject {
        let attr:collectionViewAttribute = super.copyWithZone(zone) as! collectionViewAttribute
        attr.deltaY = deltaY
        
        return attr
    }
    
    override func isEqual(object: AnyObject?) -> Bool {
        if let attr:collectionViewAttribute = object as? collectionViewAttribute {
            if attr.deltaY == deltaY{
                return super.isEqual(object)
            }
        }
        
        return false
    }
}

class MeLayout : UICollectionViewFlowLayout{
    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        return true
    }
    
    override class func layoutAttributesClass() -> AnyClass{
        return collectionViewAttribute.self
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [AnyObject]? {
        var attributeArray = super.layoutAttributesForElementsInRect(rect) as! [collectionViewAttribute]
        
        let offset = collectionView!.contentOffset
        
        if offset.y < 0 {
            let delta = fabs(offset.y)
            for attr in attributeArray{
                if let elementKind = attr.representedElementKind {
                    if elementKind == UICollectionElementKindSectionHeader {
                        var frame = attr.frame
                        frame.size.height = headerReferenceSize.height + delta
                        frame.origin.y = CGRectGetMinY(frame) - delta
                        attr.frame = frame
                        attr.deltaY = delta
                    }
                }
            }
        }
        
        return attributeArray
    }
}
