//
//  Session.swift
//  Upli
//
//  Created by 王毅 on 15/5/11.
//  Copyright (c) 2015年 Ted. All rights reserved.
//

import UIKit

class Session {
    
    var title: String
    
    
    class func allSessions() -> [Session] {
        var sessions = [Session]()
        if let URL = NSBundle.mainBundle().URLForResource("Sessions", withExtension: "plist") {
            if let sessionsFromPlist = NSArray(contentsOfURL: URL) {
                for dictionary in sessionsFromPlist {
                    let session = Session(dictionary: dictionary as! NSDictionary)
                    sessions.append(session)
                }
            }
        }
        return sessions
    }
    
    init(title: String) {
        self.title = title
        //self.speaker = speaker
        //self.room = room
        //self.time = time
    }
    
    convenience init(dictionary: NSDictionary) {
        let title = dictionary["Title"] as? String
        //let speaker//dictionary["Speaker"] as? String
        //let room //'dictionary["Room"] as? String
        //let time //'dictionary["Time"] as? String
        self.init(title: title!)
    }
    
}

