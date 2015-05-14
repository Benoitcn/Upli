//
//  SetUpProfileStep2CollectionViewController.swift
//  Upli
//
//  Created by 王毅 on 15/5/14.
//  Copyright (c) 2015年 Ted. All rights reserved.
//

import UIKit

let reuseIdentifier = "Cell"

class SetUpProfileStep2CollectionViewController: UICollectionViewController {
  let setUpProfileStep2s = SetUpProfileStep2.allSetUpProfileStep2()
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    var cameraButtonItem:UIBarButtonItem{
        
        return UIBarButtonItem(barButtonSystemItem:.Camera, target:self, action: "cameraAction:")
    }
    
    
    func cameraAction(barButtonItem:UIBarButtonItem ){
    print("111111")
    }
    @IBAction func back(sender: AnyObject) {
         print("111111")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        let width = CGRectGetWidth(collectionView!.bounds)
        let layout = collectionViewLayout as! MeLayout
        layout.itemSize = CGSize(width: width, height: 150)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 1
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return setUpProfileStep2s.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("SetUpProfileStep2Cell", forIndexPath: indexPath)as! SetUpProfileStep2Cell
        cell.setUpProfileStep2 = setUpProfileStep2s[indexPath.item]
        return cell
    }


    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        let food = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "FooterView", forIndexPath: indexPath) as! FooterView
        
        return food
    }
    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
