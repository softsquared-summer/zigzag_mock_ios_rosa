//
//  mainTabViewController.swift
//  ios
//
//  Created by 이진하 on 2020/06/02.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit
import Tabman
import Pageboy

class mainTabViewController: TabmanViewController {
    private var views = [MainViewController(),bestViewController(),newViewController()]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        let bar = TMBar.ButtonBar()
        bar.layout.transitionStyle = .snap // Customize
        bar.layout.contentInset = UIEdgeInsets(top: 0, left: 0,  bottom: 0, right: 0)
        bar.layout.alignment = .centerDistributed
        // Add to view
        bar.tintColor = UIColor.black
        bar.buttons.customize{(button) in
            button.selectedTintColor = ColorPalette.zigzagPink
            button.tintColor = UIColor.black
        }
        bar.indicator.tintColor = ColorPalette.zigzagPink
        bar.indicator.weight = .light
        addBar(bar, dataSource: self, at: .top)
   }
    
}
extension mainTabViewController : PageboyViewControllerDataSource , TMBarDataSource {
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return views.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return views[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        var title = ""
        if index == 0 {
            title = "홈                "
        }else if index == 1 {
            title = "베스트              "
        }else if index == 2 {
            title = "신상              "
        }
        return TMBarItem(title: title)
    }
}
