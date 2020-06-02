//
//  rankViewController.swift
//  ios
//
//  Created by 이진하 on 2020/06/02.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class rankViewController: UIViewController {

    var malls:[mall] = []
    var tags:tag = tag()
    @IBOutlet weak var mallTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let mallNib = UINib(nibName: "TableViewCell", bundle: nil)
        self.mallTableView.register(mallNib, forCellReuseIdentifier: "mall")
        self.mallTableView.delegate = self
        self.mallTableView.dataSource = self
        self.mallTableView.estimatedRowHeight = 550.0
    }
    override func viewWillAppear(_ animated: Bool) {
        rankDataManager().getUser(self)
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
        let rank:String = String(malls[indexPath.row].mall_rank)
        cell.rank.text = rank
        cell.mall_tag.text = malls[indexPath.row].tags.tag_name
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailMall = detailMallViewController()
        detailMall.mall_id = self.malls[indexPath.row].mall_id
        self.navigationController?.pushViewController(detailMall, animated: true)
        
    }
    
    
}
