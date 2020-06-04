//
//  basketItemTableViewCell.swift
//  ios
//
//  Created by 이진하 on 2020/06/04.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class basketItemTableViewCell: UITableViewCell {

    @IBOutlet weak var ship: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var num: UILabel!
    @IBOutlet weak var item_option: UILabel!
    @IBOutlet weak var mall_image: UIImageView!
    @IBOutlet weak var mall_name: UILabel!
    @IBOutlet weak var item_name: UILabel!
    @IBOutlet weak var item_image: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
