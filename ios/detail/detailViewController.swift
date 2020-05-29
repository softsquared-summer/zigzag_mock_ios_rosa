//
//  detailViewController.swift
//  ios
//
//  Created by 이진하 on 2020/05/29.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class detailViewController: UIViewController {
    
    var item_id:Int! = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        print(item_id)
    }
    var mall_name:String? = ""
    var item_name:String? = ""
    var comment_num:Int? = 0
    var is_heart:Bool? = false
    var discount:String? = ""
    var price:String? = ""
    override func viewWillAppear(_ animated: Bool) {
        
        detailDataManager().getDetail(self,item_id : item_id)
        
    }
}
