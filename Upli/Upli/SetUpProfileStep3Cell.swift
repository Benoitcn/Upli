//
//  SetUpProfileStep3Cell.swift
//  Upli
//
//  Created by 王毅 on 15/5/12.
//  Copyright (c) 2015年 Ted. All rights reserved.
//

import UIKit

class SetUpProfileStep3Cell: UICollectionViewCell ,UIPickerViewDataSource,UIPickerViewDelegate{
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var pickval: UIPickerView!
    var PickerItem:NSArray = []
    var setUpProfileStep3: SetUpProfileStep3? {
        didSet {
            if let setUpProfileStep3 = setUpProfileStep3 {
                titleLabel.text = setUpProfileStep3.titleLabel
                PickerItem=setUpProfileStep3.pickval
                pickval.dataSource=self
                pickval.delegate=self
            }
        }
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return PickerItem.objectAtIndex(row) as! String
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return PickerItem.count
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
