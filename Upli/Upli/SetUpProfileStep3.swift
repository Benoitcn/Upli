//
//  SetUpProfileStep3.swift
//  Upli
//
//  Created by 王毅 on 15/5/12.
//  Copyright (c) 2015年 Ted. All rights reserved.
//

import UIKit

class SetUpProfileStep3 {
    
    var titleLabel: String
    var pickval:NSArray
    
    class func allSetUpProfileStep3() -> [SetUpProfileStep3] {
        var setUpProfileStep3s = [SetUpProfileStep3]()
        if let URL = NSBundle.mainBundle().URLForResource("SetUpProfileStep3Item", withExtension: "plist") {
            if let sessionsFromPlist = NSArray(contentsOfURL: URL) {
                for dictionary in sessionsFromPlist {
                    let setUpProfileStep3 = SetUpProfileStep3(dictionary: dictionary as! NSDictionary)
                    setUpProfileStep3s.append(setUpProfileStep3)
                }
            }
        }
        return setUpProfileStep3s
    }
    
    init(title: String,pickval:NSArray) {
        self.titleLabel = title
        self.pickval=pickval
    }
    
    convenience init(dictionary: NSDictionary) {
        let title = dictionary["Title"] as? String
        let pickval=dictionary["Pick"]as? NSArray
        self.init(title: title!,pickval:pickval!)
    }
    
}

