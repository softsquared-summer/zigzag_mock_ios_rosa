//
//  itemCollectionViewCell.swift
//  ios
//
//  Created by 이진하 on 2020/05/28.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class itemCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    @IBOutlet weak var free_ship: UILabel!
 
    @IBAction func heart(_ sender: Any) {

        if self.heart.isSelected == true {
            self.heart.isSelected = false
            self.heart.tintColor = UIColor.white
        }else {
            self.heart.isSelected = true
            self.heart.tintColor = ColorPalette.zigzagPink
        }
        
    }
    @IBOutlet weak var heart: UIButton!
    @IBOutlet weak var mall_name: UILabel!
    @IBOutlet weak var item_name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var item_image: UIImageView!
    
}
