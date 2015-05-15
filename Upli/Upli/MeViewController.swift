//
//  ScheduleViewController.swift
//  Upli
//
//  Created by 王毅 on 15/5/11.
//  Copyright (c) 2015年 Ted. All rights reserved.
//

import UIKit

class MeViewController: UICollectionViewController {
    
    let mes = Me.allSessions()
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let width = CGRectGetWidth(collectionView!.bounds)
        let layout = collectionViewLayout as! MeLayout
        layout.itemSize = CGSize(width: width, height: 50)
        layout.headerReferenceSize = CGSizeMake(width, 202)
    }
    
}

extension MeViewController {
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        var anotherView:UIViewController = UIViewController()
        var storyBoard:UIStoryboard = self.storyboard!
        if indexPath.item==0
        {
             anotherView = storyBoard.instantiateViewControllerWithIdentifier("NavMe2") as! UIViewController
        }
        
       //self.navigationController?.pushViewController(anotherView, animated: true)
        self.navigationController?.presentViewController(anotherView, animated: true, completion: nil)
    }
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mes.count
    }
    
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "HeaderView", forIndexPath: indexPath) as! HeaderView
        return header
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("MeCell", forIndexPath: indexPath)as! MeCell
        cell.me = mes[indexPath.item]
        return cell
    }
    
}