//
//  SetUpProfileStep2.swift
//  Upli
//
//  Created by 王毅 on 15/5/14.
//  Copyright (c) 2015年 Ted. All rights reserved.
//

import UIKit

class SetUpProfileStep2 {
    
    var titleLabel: String
    var Bg:UIImage
    
    class func allSetUpProfileStep2() -> [SetUpProfileStep2] {
        var setUpProfileStep2s = [SetUpProfileStep2]()
        if let URL = NSBundle.mainBundle().URLForResource("SetUpProfileStep2Item", withExtension: "plist") {
            if let sessionsFromPlist = NSArray(contentsOfURL: URL) {
                for dictionary in sessionsFromPlist {
                    let setUpProfileStep2 = SetUpProfileStep2(dictionary: dictionary as! NSDictionary)
                    setUpProfileStep2s.append(setUpProfileStep2)
                }
            }
        }
        return setUpProfileStep2s
    }
    
    init(title: String,bg:UIImage) {
        self.titleLabel = title
        self.Bg=bg
    }
    
    convenience init(dictionary: NSDictionary) {
        let title = dictionary["Title"] as? String
        let bg=dictionary["Bg"]as? String
         let image = UIImage(named: bg!)?.decompressedImage
        self.init(title: title!,bg:image!)
    }
    
}