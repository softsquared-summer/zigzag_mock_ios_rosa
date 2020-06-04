//
//  barButtons.swift
//  ios
//
//  Created by 이진하 on 2020/06/02.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit



let menuBarButtonItem: UIBarButtonItem = {
    let barButtonItem = UIBarButtonItem(title: "검색", style: .plain, target: MainViewController(), action: nil)
    barButtonItem.image = UIImage(named: "메뉴")
    return barButtonItem
}()


let heartBarButtonItem: UIBarButtonItem = {
    let barButtonItem = UIBarButtonItem(title: "검색", style: .plain, target: MainViewController(), action: nil)
    barButtonItem.image = UIImage(named: "가위")
    return barButtonItem
}()

let rightBarButtonItem: UIBarButtonItem = {
    let barButtonItem = UIBarButtonItem(title: "검색", style: .plain, target: MainViewController(), action: nil)
    barButtonItem.imageInsets = .init(top: 0, left:0, bottom: 0, right: 0)
    barButtonItem.image = UIImage(named: "zigzag_bag_standard")
    return barButtonItem
}()

let searchBarButtonItem: UIBarButtonItem = {
    let barButtonItem = UIBarButtonItem(title: "검색", style: .plain, target: MainViewController(), action: nil)
    let button = UIButton()
    button.frame = CGRect(x: 0, y: 0, width: 240, height: 35)
    button.backgroundColor = UIColor.systemGray6
    button.setTitle("   검색어를 입력해주세요", for: .normal)
    button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 0)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
    button.tintColor = UIColor.systemGray
    button.setTitleColor(UIColor.opaqueSeparator, for: .normal)
    button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
    
    
    button.setImage(UIImage(systemName:"magnifyingglass"), for: .normal)
//    button.image(for: .normal) = UIImage(named: )
    button.layer.cornerRadius = 17
    barButtonItem.customView = button
    //    barButtonItem.customView
    return barButtonItem
}()
let zigzagBarButtonItem: UIBarButtonItem = {
    let barButtonItem = UIBarButtonItem(title: "", style: .plain, target: MainViewController(), action: nil)
    barButtonItem.image = UIImage(named: "zigzag")
    return barButtonItem
}()

class barButtons: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
