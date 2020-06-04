//
//  mallViewController.swift
//  ios
//
//  Created by 이진하 on 2020/06/01.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit
import Tabman
import Pageboy
class mallViewController: TabmanViewController, PageboyViewControllerDataSource , TMBarDataSource {
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        var title = ""
        if index == 0 {
            title = "랭킹                  "
        }else {
            title = "즐겨찾기                 "
        }
        return TMBarItem(title: title)
    }
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
    
    private var viewControllers = [rankViewController(), bookmarkViewController()]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        let bar = TMBar.ButtonBar()
        bar.layout.transitionStyle = .snap // Customize
        //        bar.layout.contentInset = UIEdgeInsets(top: 0, left: 100,  rbottom: 0, right: 100)
        bar.layout.alignment = .centerDistributed
        // Add to view
        bar.tintColor = UIColor.black
        bar.backgroundColor = UIColor.white
        bar.buttons.customize{(button) in
            button.selectedTintColor = UIColor.black
            button.tintColor = UIColor.black
        }
        bar.indicator.tintColor = UIColor.black
        addBar(bar, dataSource: self, at: .top)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let titleLabel = UILabel()
        titleLabel.text = "  쇼핑몰".localized
        titleLabel.textAlignment = .left
        titleLabel.sizeToFit()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        let titleItem:UIBarButtonItem  = UIBarButtonItem.init(customView: titleLabel)
        
        let leftButtons:[UIBarButtonItem]? = [titleItem]
        let rightButtons:[UIBarButtonItem]? = [rightBarButtonItem, searchIconBarButtonItem,tagIconBarButtonItem]
        self.tabBarController?.navigationController?.navigationBar.topItem?.setLeftBarButtonItems(leftButtons, animated: false)
        self.tabBarController?.navigationController?.navigationBar.topItem?.setRightBarButtonItems(rightButtons, animated: false)
        self.tabBarController?.tabBar.barTintColor = .white
        self.tabBarController?.tabBar.backgroundImage = UIImage()
        self.tabBarController?.tabBar.shadowImage = UIImage()
        
    }
}
