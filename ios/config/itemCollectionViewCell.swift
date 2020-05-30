//
//  itemCollectionViewCell.swift
//  ios
//
//  Created by 이진하 on 2020/05/28.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit
import WCLShineButton

@available(iOS 13.0, *)
class itemCollectionViewCell: UICollectionViewCell {

    var bt1:WCLShineButton = WCLShineButton()
    var item_id:Int = 0
    var isHeart:Bool = false
    var superController:UIViewController = MainViewController()
    override func awakeFromNib() {
        super.awakeFromNib()
        var param1 = WCLShineParams()
                param1.bigShineColor = ColorPalette.zigzagPink
                param1.smallShineColor = UIColor(rgb: (170,170,170))
                param1.animDuration = 1
                bt1 = WCLShineButton(frame: .init(x: 140, y:115, width: 20, height: 20), params: param1)
                bt1.fillColor = ColorPalette.zigzagPink
                bt1.color = UIColor(rgb: (170,170,170))
        if isHeart == true {
            bt1.isSelected == true
        }else {
            bt1.isSelected == false
        }
                bt1.addTarget(self, action: #selector(heartAction), for: .valueChanged)
                self.addSubview(bt1)
        
    }
    @objc func heartAction(){
        print(self.item_id)
        print(bt1.isSelected)
        mainHeartDataManager().set_heart(self.superController as! MainViewController, item_id: self.item_id)
    }
    @IBOutlet weak var free_ship: UILabel!
 
   
    @IBOutlet weak var mall_name: UILabel!
    @IBOutlet weak var item_name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var item_image: UIImageView!
    
}
