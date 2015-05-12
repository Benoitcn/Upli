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
    @IBOutlet private weak var separatorViewHeightLayoutConstraint: NSLayoutConstraint!
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
    override func awakeFromNib() {
        super.awakeFromNib()
        separatorViewHeightLayoutConstraint.constant = 1
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView!) -> UIView {
        var pickerLabel:UILabel=UILabel()
        
        pickerLabel.textColor=UIColor.blackColor()
        pickerLabel.textAlignment=NSTextAlignment.Center
        pickerLabel.adjustsFontSizeToFitWidth = true;
        pickerLabel.tintColor=UIColor.redColor()// .backgroundColor = UIColor(hue: 0.1, saturation: 1, brightness: 2, alpha: 1)
        pickerLabel.font=UIFont.boldSystemFontOfSize(20)
        pickerLabel.text = pickerView2(pickerView, titleForRow: row, forComponent: component)
        return pickerLabel;
        
    }
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 36.0
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //myLabel.text = pickerData[row]
    }
    func pickerView2(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return PickerItem.objectAtIndex(row) as! String
    }
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData: AnyObject = PickerItem[row]
        var myTitle = NSAttributedString(string: titleData as! String, attributes: [NSFontAttributeName:UIFont(name: "Georgia", size: 15.0)!,NSForegroundColorAttributeName:UIColor.blueColor()])
        return myTitle
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return PickerItem.count
    }


}
