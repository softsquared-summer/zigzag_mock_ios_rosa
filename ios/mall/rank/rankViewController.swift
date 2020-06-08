//
//  rankViewController.swift
//  ios
//
//  Created by 이진하 on 2020/06/02.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class rankViewController: UIViewController {

    let mallBtn:[String] = ["쵸퍼","소녀나라","밍스","본지샵","시크스튜","라일론","불량소녀"]
    var malls:[mall] = []
    var tags:tag = tag()
    var btnScroll:UIScrollView!
    let buttonPadding:CGFloat = 10
    var xOffset:CGFloat = 5
    @IBOutlet weak var mallTableView: UITableView!
    let ranking:[String] = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15"]
    override func viewDidLoad() {
        super.viewDidLoad()
        let mallNib = UINib(nibName: "TableViewCell", bundle: nil)
        self.mallTableView.register(mallNib, forCellReuseIdentifier: "mall")
        self.mallTableView.delegate = self
        self.mallTableView.dataSource = self
        self.mallTableView.estimatedRowHeight = 550.0
        
        btnScroll = UIScrollView(frame: CGRect(x: 0, y:90, width: self.view.layer.bounds.width + 40, height: 90))
        self.view.addSubview(btnScroll)
        
        btnScroll.backgroundColor = .white
        btnScroll.showsHorizontalScrollIndicator = false
        for i in 0 ... mallBtn.count-1 {
            let button = UIButton()
            button.tag = i
            button.setBackgroundImage(UIImage(named: mallBtn[i]), for: .normal)
            
            button.frame = CGRect(x: xOffset, y: CGFloat(buttonPadding), width: 70, height: 80)
            
            xOffset = xOffset + CGFloat(buttonPadding) + button.frame.size.width
            btnScroll.addSubview(button)
        }
        btnScroll.contentSize = CGSize(width: xOffset, height: btnScroll.frame.height)
    }
    override func viewWillAppear(_ animated: Bool) {
        rankDataManager().getMalls(self,page: 1)
        rankDataManager().getMalls(self,page: 2)
        rankDataManager().getMalls(self,page: 3)
        rankDataManager().getMalls(self,page: 4)
    }

}

extension rankViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return malls.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = mallTableView.dequeueReusableCell(withIdentifier: "mall", for: indexPath) as? TableViewCell else { return UITableViewCell() }
        cell.mallImage.image = UIImage(named: "mall_image")
        cell.mall_name.text = malls[indexPath.row].mall_name
        let _:String = String(malls[indexPath.row].mall_rank)
        cell.rank.text = ranking[indexPath.row]
        if malls[indexPath.row].tags.tag_name != "없음"{
            cell.mall_tag.text = malls[indexPath.row].tags.tag_name
            cell.mall_tag.textColor = .brown
        }else{
            cell.mall_tag.isHidden = true
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailMall = detailMallViewController()
        detailMall.mall_id = self.malls[indexPath.row].mall_id
        self.navigationController?.pushViewController(detailMall, animated: true)
        
    }
    
    
}
