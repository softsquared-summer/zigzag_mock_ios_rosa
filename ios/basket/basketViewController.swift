//
//  basketViewController.swift
//  ios
//
//  Created by 이진하 on 2020/06/04.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit
import BEMCheckBox

class basketViewController: UIViewController {
    var items:[basketItem] = []
    var num:Int! = 0
    @IBOutlet weak var itemTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let basketNib = UINib(nibName: "basketItemTableViewCell", bundle: nil)
        self.itemTableView.register(basketNib, forCellReuseIdentifier: "basketCell")
        self.itemTableView.delegate = self
        self.itemTableView.dataSource = self
        self.itemTableView.estimatedRowHeight = 550.0
        
    }

    override func viewWillAppear(_ animated: Bool) {
        basketListDataManager().getBasketItems(self)
    }
}
extension basketViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = itemTableView.dequeueReusableCell(withIdentifier: "basketCell", for: indexPath) as? basketItemTableViewCell else {return UITableViewCell()}
        cell.mall_image.image = UIImage(named: "mall_image")
        cell.item_name.text = items[indexPath.row].item_name
        cell.item_image.image = UIImage(named: "스커트")
        cell.item_option.text = items[indexPath.row].color + " / " + items[indexPath.row].size
        cell.price.text = items[indexPath.row].price
        cell.ship.text = String(items[indexPath.row].ship)+"원"
        cell.mall_name.text = items[indexPath.row].mall_name
        cell.num.text = String(items[indexPath.row].num)
        return cell
    }
    
    
}
