//
//  collectViewController.swift
//  ios
//
//  Created by 이진하 on 2020/06/02.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class collectViewController: UIViewController {
    @IBOutlet weak var adTableView: UITableView!
    let buttonImages:[String]! = ["무료배송","아우터","상의","원피스","바지","skert","슈즈","가방","액세서리","패션소품"]
    let adImages:[String] = ["1","2","3","4","5","6","7","8","9"]
    var btnScroll:UIScrollView!
    let buttonPadding:CGFloat = 10
    var xOffset:CGFloat = 5
    override func viewDidLoad() {
        super.viewDidLoad()
        self.adTableView.separatorStyle = .none
        self.adTableView.separatorInset = .init(top: 10, left: 0, bottom: 0, right: 10)
        self.adTableView.dataSource = self
        self.adTableView.delegate = self
        let adNib = UINib(nibName: "adTableViewCell", bundle: nil)
        self.adTableView.register(adNib, forCellReuseIdentifier: "ad")
        
        btnScroll = UIScrollView(frame: CGRect(x: 0, y: 0, width: self.view.layer.bounds.width + 40, height: 90))
        self.view.addSubview(btnScroll)
        
        btnScroll.backgroundColor = .white
        btnScroll.showsHorizontalScrollIndicator = false
        for i in 0 ... buttonImages.count-1 {
            let button = UIButton()
            button.tag = i
            button.setBackgroundImage(UIImage(named: buttonImages[i]), for: .normal)
            button.addTarget(self, action: #selector(btnTouch), for: UIControl.Event.touchUpInside)
            
            button.frame = CGRect(x: xOffset, y: CGFloat(buttonPadding), width: 70, height: 80)
            
            xOffset = xOffset + CGFloat(buttonPadding) + button.frame.size.width
            btnScroll.addSubview(button)
        }
        btnScroll.contentSize = CGSize(width: xOffset, height: btnScroll.frame.height)
    }
    override func viewWillAppear(_ animated: Bool) {
        let titleLabel = UILabel()
        titleLabel.text = "  모아보기".localized
        titleLabel.textAlignment = .left
        titleLabel.sizeToFit()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 25)
        var titleItem:UIBarButtonItem  = UIBarButtonItem.init(customView: titleLabel)
        
        let leftButtons:[UIBarButtonItem]? = [titleItem]
        let rightButtons:[UIBarButtonItem]? = [rightBarButtonItem]
        self.tabBarController?.navigationController?.navigationBar.topItem?.setLeftBarButtonItems(leftButtons, animated: false)
        self.tabBarController?.navigationController?.navigationBar.topItem?.setRightBarButtonItems(rightButtons, animated: false)
    }
    
    @objc func btnTouch(_sender: UIButton){
        let tag:Int! = _sender.tag
        print(tag)
        let categoryVC = categoryViewController()
        self.navigationController?.pushViewController(categoryVC, animated: true)
        let keyword:String! = buttonImages[tag]
        categoryVC.keyword = keyword
    }
}


extension collectViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        adImages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = adTableView.dequeueReusableCell(withIdentifier: "ad", for: indexPath) as? adTableViewCell else { return UITableViewCell() }
        cell.ad.image = UIImage(named: adImages[indexPath.row])
        return cell
    }
    
    
}
