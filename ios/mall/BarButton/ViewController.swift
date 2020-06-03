//
//  ViewController.swift
//  ios
//
//  Created by 이진하 on 2020/06/02.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

let searchIconBarButtonItem: UIBarButtonItem = {
    let button = UIButton(type: UIButton.ButtonType.custom)
    button.setImage(UIImage(named: "search2"), for: .normal)
    
    button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
    let barButton = UIBarButtonItem(customView: button)
//    let barButtonItem = UIBarButtonItem(title: "검색", style: .plain, target: MainViewController(), action: nil)
//    barButtonItem.imageInsets = .init(top: 0, left:5, bottom: 0, right: 0)
//    barButtonItem.image = UIImage(named: "search2")
    return barButton
}()
let tagIconBarButtonItem: UIBarButtonItem = {
    let button = UIButton(type: UIButton.ButtonType.custom)
    button.setImage(UIImage(named: "tag"), for: .normal)
    button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
    let barButton = UIBarButtonItem(customView: button)
//    let barButtonItem = UIBarButtonItem(title: "검색", style: .plain, target: MainViewController(), action: nil)
//    barButtonItem.imageInsets = .init(top: 0, left:0, bottom: 0, right: 5)
//    barButtonItem.image = UIImage(named: "tag")
    return barButton
}()

