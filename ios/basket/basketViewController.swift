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
    
        
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var total_price: UILabel!
    @IBOutlet weak var all_ship: UILabel!
    @IBOutlet weak var all_select: UILabel!
    @IBOutlet weak var all_price: UILabel!
    @IBOutlet weak var first: BEMCheckBox!
    @IBOutlet weak var delete: UIButton!
    var items:[basketItem] = []
    var num:Int! = 0
    @IBOutlet weak var itemTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.all_select.text = self.all_select.text! + "(0/6)"
        self.delete.layer.cornerRadius = 18
        let basketNib = UINib(nibName: "basketItemTableViewCell", bundle: nil)
        self.itemTableView.register(basketNib, forCellReuseIdentifier: "basketCell")
        self.itemTableView.delegate = self
        self.itemTableView.dataSource = self
        self.itemTableView.estimatedRowHeight = 550.0
        self.itemTableView.separatorStyle = .none
        self.first.onCheckColor = UIColor.white
        self.first.onTintColor = UIColor.white
        self.first.offFillColor = UIColor.systemGray4
        self.first.onFillColor = ColorPalette.zigzagPink
        self.first.tintColor = UIColor.white
        self.buyButton.layer.cornerRadius = 24
        self.buyButton.layer.backgroundColor = ColorPalette.zigzagPink.cgColor
        self.total_price.tintColor = ColorPalette.zigzagPink
        
        
    }
    var totalPrice:Double = 0
    var totalShip:Int = 0
    
    override func viewWillAppear(_ animated: Bool) {
        basketListDataManager().getBasketItems(self)
        
    }
    func printChars(string: String, t:String) -> String{
        var str = string
        var t2 = t
        if(str.count == 0){
            return t2
        }else{
            if str[str.startIndex] == "," {
                str.remove(at: str.startIndex)
            }else if str[str.startIndex] == "원" {
                str.remove(at: str.startIndex)
            }else {
                t2 =  t2 + String(str[str.startIndex])
                str.remove(at: str.startIndex)
            }
        }
        return printChars(string: str, t: t2)
    }
    func comma(num: Int) -> String{
        var point = 0
        var str = ""
        
        var strNum = String(num)
        point = strNum.count % 3
        
        let len = strNum.count
        
        while(point < len) {
            for i in 0...2 {
                str =  String(strNum[strNum.index(before: strNum.endIndex)]) + str
                strNum.remove(at: strNum.index(before: strNum.endIndex))
            }
            if strNum != "" {str = "," + str}
            point += 3
            //str = 005
            //strNum = 1203
        }
        str = strNum + str
        
        return str
        
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
        let t2 = ""
        let text = Double(printChars(string: items[indexPath.row].price ,t: t2))! * Double(items[indexPath.row].num)
        self.totalPrice += text
        self.totalShip += items[indexPath.row].ship
        cell.price.text = String(comma(num: Int(text)))+"원"
        cell.ship.text = "배송비 " + String(comma(num: items[indexPath.row].ship))+"원"
        cell.mall_name.text = items[indexPath.row].mall_name
        cell.num.text = String(items[indexPath.row].num)+"개"
        return cell
    }
    
    
    
}

