//
//  myPageViewController.swift
//  ios
//
//  Created by 이진하 on 2020/06/04.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class myPageViewController: UIViewController {

    @IBAction func login(_ sender: Any) {
        self.tabBarController?.navigationController?.pushViewController(loginViewController(), animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
