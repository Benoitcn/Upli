//
//  Session.swift
//  Upli
//
//  Created by 王毅 on 15/5/11.
//  Copyright (c) 2015年 Ted. All rights reserved.
//

import UIKit

class Me {
    
    var title: String
    var titleico:UIImage
    
    class func allSessions() -> [Me] {
        var mes = [Me]()
        if let URL = NSBundle.mainBundle().URLForResource("Me", withExtension: "plist") {
            if let sessionsFromPlist = NSArray(contentsOfURL: URL) {
                for dictionary in sessionsFromPlist {
                    let me = Me(dictionary: dictionary as! NSDictionary)
                    mes.append(me)
                }
            }
        }
        return mes
    }
    
    init(title: String,titleico:UIImage) {
        self.title = title
        self.titleico=titleico
    }
    
    convenience init(dictionary: NSDictionary) {
        let title = dictionary["Title"] as? String
        let _titleico=dictionary["Ico"]as? String
        let titleico=UIImage(named: _titleico!)?.decompressedImage
        self.init(title: title!,titleico:titleico!)
    }
    
}

