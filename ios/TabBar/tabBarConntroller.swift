//
//  tabBarConntroller.swift
//  ios
//
//  Created by 이진하 on 2020/05/28.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class tabBarConntroller: UITabBarController,UITabBarControllerDelegate {
    let book = bookmarkViewController()
    let rank = rankViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        book.view.backgroundColor = UIColor.systemGray2
        book.title = "first"
        rank.view.backgroundColor = UIColor.black
        rank.title = "seocond"
        super.viewWillAppear(animated)
        let main = mainTabViewController()
        let login = loginViewController()
        let mall = mallViewController()
        let collect = collectViewController()
        let icon1 = UITabBarItem(title: nil, image: UIImage(named: "main_icon"), selectedImage: UIImage(named: "main_icon_selected"))
        let icon2 = UITabBarItem(title: nil, image: UIImage(named: "my_icon"), selectedImage: UIImage(named: "my_icon_selected"))
        let icon3 = UITabBarItem(title: nil, image: UIImage(named: "mall"), selectedImage: UIImage(named: "mall_selected"))
        let icon4 = UITabBarItem(title: nil, image: UIImage(named: "collect"), selectedImage: UIImage(named: "collect_selected"))
        main.tabBarItem = icon1
        login.tabBarItem = icon2
        mall.tabBarItem = icon3
        collect.tabBarItem = icon4
        let controllers = [main,mall,collect,login]
        self.viewControllers = controllers
        
        
    }
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        print("Should select viewController: \(viewController.title ?? "") ?")
        return true;
    }
    
    
}
