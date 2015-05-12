//
//  CollectionViewController.swift
//  Upli
//
//  Created by 王毅 on 15/5/11.
//  Copyright (c) 2015年 Ted. All rights reserved.
//

import UIKit

var txtName=""
class EditProfileViewController: UICollectionViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        let width = CGRectGetWidth(collectionView!.bounds)
        let layout = collectionViewLayout as! MeLayout
        layout.itemSize = CGSize(width: width, height: 50)
        layout.headerReferenceSize = CGSizeMake(width, 162)

        //self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }
    override func awakeFromNib() {
        //<#code#>
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return "\(row+1)"
    }
   

}
