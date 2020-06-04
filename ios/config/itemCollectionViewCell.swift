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
        self.discount.textColor = ColorPalette.zigzagPink
        //        self.item_image.frame.size = CGSize(width: 185, height: 200)
        self.item_image.clipsToBounds = true
        self.item_image.layer.masksToBounds = true
        self.item_image.layer.cornerRadius = 4
        self.free_ship.layer.cornerRadius = 3
        self.free_ship.layer.masksToBounds = true
        self.free_ship.alpha = 0.7
        
        
        
        var param1 = WCLShineParams()
        param1.bigShineColor = ColorPalette.zigzagPink
        param1.smallShineColor = UIColor(rgb: (170,170,170))
        param1.animDuration = 1
        bt1 = WCLShineButton(frame: .init(x: 150, y:194, width: 20, height: 20), params: param1)
        bt1.fillColor = ColorPalette.zigzagPink
        bt1.color = UIColor.systemGray5
        bt1.image = .custom(UIImage(named:"emptyheart")!)
//        if isHeart == true {
//            bt1.isSelected = true
//        }else {
//            bt1.isSelected = false
//        }
        self.addSubview(bt1)
        
    }
    
    @IBOutlet weak var free_ship: UILabel!
    
    
    @IBOutlet weak var discount: UILabel!
    @IBOutlet weak var mall_name: UILabel!
    @IBOutlet weak var item_name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var item_image: UIImageView!
    
}
