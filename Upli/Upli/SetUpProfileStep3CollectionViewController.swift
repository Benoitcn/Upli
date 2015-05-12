//
//  SetUpProfileStep3CollectionViewController.swift
//  Upli
//
//  Created by 王毅 on 15/5/12.
//  Copyright (c) 2015年 Ted. All rights reserved.
//

import UIKit

class SetUpProfileStep3CollectionViewController: UICollectionViewController {

    let setUpProfileStep3s = SetUpProfileStep3.allSetUpProfileStep3()
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = CGRectGetWidth(collectionView!.bounds)
        let layout = collectionViewLayout as! MeLayout
        layout.itemSize = CGSize(width: width, height: 50)
        layout.headerReferenceSize = CGSizeMake(width, 162)
    }
}
extension SetUpProfileStep3CollectionViewController {
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        
    }
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return setUpProfileStep3s.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("SetUpProfileStep3Cell", forIndexPath: indexPath)as! SetUpProfileStep3Cell
        cell.setUpProfileStep3 = setUpProfileStep3s[indexPath.item]
        return cell
}
}
