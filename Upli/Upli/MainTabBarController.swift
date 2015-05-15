//
//  MainTabBarController.swift
//  Upli
//
//  Created by 王毅 on 15/5/15.
//  Copyright (c) 2015年 Ted. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        /// 获取两个Tab对应的 Storyboard
        let story_first = UIStoryboard(name: "DiscoverStoryboard", bundle: nil)
        let story_second = UIStoryboard(name: "TrainningStoryboard", bundle: nil)
        let story_fourth = UIStoryboard(name: "NewsStoryboard", bundle: nil)
        let story_fifth = UIStoryboard(name: "MeStoryboard", bundle: nil)
        /// 获取Tab 对应的第一个 ViewController
        let first_nav_viewcontroller = story_first.instantiateViewControllerWithIdentifier("NavDiscover") as! UINavigationController
        let second_nav_viewcontroller = story_second.instantiateViewControllerWithIdentifier("NavTrainning")as!UINavigationController
         let fourth_nav_viewcontroller = story_fourth.instantiateViewControllerWithIdentifier("NavNews")as!UINavigationController
         let fifth_nav_viewcontroller = story_fifth.instantiateViewControllerWithIdentifier("NavMe")as!UINavigationController
        /// 设置 tabBar 内容
        first_nav_viewcontroller.tabBarItem = UITabBarItem(title: "Discover", image: nil, tag: 0)
        second_nav_viewcontroller.tabBarItem = UITabBarItem(title: "Trainning", image: nil, tag: 1)
        fourth_nav_viewcontroller.tabBarItem=UITabBarItem(title: "News", image: nil, tag:2)
        fifth_nav_viewcontroller.tabBarItem=UITabBarItem(title: "Me", image: nil, tag:3)

        /// 为我们的 UITabBarController 设置对应的两个ViewController
        self.viewControllers = [first_nav_viewcontroller, second_nav_viewcontroller,fourth_nav_viewcontroller,fifth_nav_viewcontroller]

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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
