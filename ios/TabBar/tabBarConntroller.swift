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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let main = MainViewController()
        let login = loginViewController()
        let icon1 = UITabBarItem(title: nil, image: UIImage(named: "main_icon"), selectedImage: UIImage(named: "main_icon_selected"))
        let icon2 = UITabBarItem(title: nil, image: UIImage(named: "my_icon"), selectedImage: UIImage(named: "my_icon_selected"))
        main.tabBarItem = icon1
        login.tabBarItem = icon2
        let controllers = [main, login]
        self.viewControllers = controllers

    }
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        print("Should select viewController: \(viewController.title ?? "") ?")
        return true;
    }


}
