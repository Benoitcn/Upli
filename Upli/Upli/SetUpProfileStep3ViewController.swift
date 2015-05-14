//
//  SetUpProfileStep3ViewController.swift
//  Upli
//
//  Created by 王毅 on 15/5/14.
//  Copyright (c) 2015年 Ted. All rights reserved.
//

import UIKit

class SetUpProfileStep3ViewController: UIViewController ,UIPickerViewDataSource,UIPickerViewDelegate{
 var PickerItem:NSArray = ["1","2","3","4","5","6"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBOutlet var Picker1: UIPickerView!
    @IBOutlet var Picker2: UIPickerView!
    @IBOutlet var Picker3: UIPickerView!
    @IBOutlet var btSave: UIButton!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
