//
//  detailViewController.swift
//  ios
//
//  Created by 이진하 on 2020/05/29.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit
import WCLShineButton

@available(iOS 13.0, *)
class detailViewController: UIViewController, selectPopUpDelegate {
    func pressedDismissButton() {
        print("adsdfasdfadfsdaf")
    }
    var mallName:String? = ""
    
    
    @IBOutlet weak var mall_name2: UILabel!
    @IBOutlet weak var mall_name: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var item_name: UILabel!
    @IBOutlet weak var comment: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var buyBtn: UIButton!
    @IBOutlet weak var itemView: UIView!
    var item_id:Int! = 0
    var bt1:WCLShineButton = WCLShineButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        detailDataManager().getDetail(self,item_id : item_id)
        buyBtn.layer.cornerRadius = 28
        
        
        var param2 = WCLShineParams()
        param2.bigShineColor = ColorPalette.zigzagPink
        param2.smallShineColor = UIColor(rgb: (170,170,170))
        param2.animDuration = 1
        bt1 = WCLShineButton(frame: .init(x: 320, y:545, width: 50, height: 50), params: param2)
        bt1.fillColor = ColorPalette.zigzagPink
        bt1.tag = self.item_id
        bt1.addTarget(self, action: #selector(heartAction(_:)), for: .valueChanged)
        bt1.color = UIColor.systemGray5
        bt1.image = .custom(UIImage(named:"emptyheart")!)
        
        self.view.addSubview(bt1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        image.image = UIImage(named: "스커트")
    }
    
    @IBAction func buy(_ sender: Any) {
        let selectPopUpStoryboard = UIStoryboard(name: "selectPopUp", bundle: Bundle.main)
        guard let selectPopUp = selectPopUpStoryboard
            .instantiateViewController(withIdentifier: "selectPopUp") as? selectPopUp else {
                return
        }
        selectPopUp.selectPopUpDelegate = self
        selectPopUp.modalPresentationStyle = .custom
        selectPopUp.item_id = self.item_id
        selectPopUp.itemPrice = self.price.text!+"원"
        // 기본 팝업 세팅 끝
        
        self.present(selectPopUp, animated: true, completion: nil)
        
    }
    @objc func heartAction(_ sender: WCLShineButton){
        detailHeartDataManager().set_heart(self, item_id: item_id)
    }
}
