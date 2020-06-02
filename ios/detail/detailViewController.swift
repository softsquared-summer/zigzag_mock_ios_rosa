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
    
    
    @IBOutlet weak var mall_name2: UILabel!
    @IBOutlet weak var mall_name: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var item_name: UILabel!
    @IBOutlet weak var comment: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var buyBtn: UIButton!
    @IBOutlet weak var itemView: UIView!
    var item_id:Int! = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        detailDataManager().getDetail(self,item_id : item_id)
        buyBtn.layer.cornerRadius = 28
        
        var param1 = WCLShineParams()
        param1.bigShineColor = ColorPalette.zigzagPink
        param1.smallShineColor = UIColor(rgb: (170,170,170))
        param1.animDuration = 1
//        heart.params = param1
//        heart.isSelected = false
        var bt1 = WCLShineButton(frame: .init(x: 330, y: 640, width: 50, height: 50), params: param1)
        bt1.fillColor = ColorPalette.zigzagPink
        bt1.color = UIColor(rgb: (170,170,170))
        bt1.color = UIColor.systemGray5
        bt1.addTarget(self, action: #selector(action), for: .valueChanged)
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
    
    @objc func action(){
        detailHeartDataManager().set_heart(self, item_id: item_id)
    }
}
