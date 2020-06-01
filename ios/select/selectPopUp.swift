//
//  selectPopUp.swift
//  ios
//
//  Created by 이진하 on 2020/05/31.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit
import GMStepper

class selectPopUp: BaseViewController, selectPopUpDelegate, selectColorPopUpDelegate, selectSizePopUpDelegate {
    
    override func viewDidLoad() {
        self.price.text = ""
        self.itemView.isHidden = true
        self.numStepper.addTarget(self, action: #selector(self.stepperValueChanged), for: .valueChanged)
        self.itemInnerView.layer.cornerRadius = 10
        self.numStepper.buttonsTextColor = UIColor.black
        self.numStepper.buttonsBackgroundColor = UIColor.systemGray4
        self.numStepper.labelTextColor = UIColor.black
        self.numStepper.labelBackgroundColor = UIColor.white
        self.numStepper.labelFont = UIFont.systemFont(ofSize: 20)
        self.color.layer.cornerRadius = 5
        self.size.layer.cornerRadius = 5
        self.basket.layer.cornerRadius = 25
        self.buy.layer.cornerRadius = 25
    }
    
    @IBOutlet weak var itemView: UIView!
    @IBOutlet weak var itemInnerView: UIView!
    @IBOutlet weak var selectedItemInfo: UILabel!
    var item_id:Int! = 0
    var item_size:String! = ""
    var item_color:String! = ""
    var itemPrice:String = ""
    @IBOutlet weak var num: UILabel!
    @IBOutlet weak var numStepper: GMStepper!
    @IBOutlet weak var price: UILabel!
    var selectSizePopUpDelegate:selectSizePopUpDelegate!
    var selectPopUpDelegate:selectPopUpDelegate!
    var selectColorPopUpDelegate:selectColorPopUpDelegate!
    @IBOutlet weak var color: UIButton!
    @IBOutlet weak var size: UIButton!
    
    @IBOutlet weak var buy: UIButton!
    @IBAction func buyNow(_ sender: Any) {
    }
    @IBOutlet weak var basket: UIButton!
    
    @IBAction func selectColor(_ sender: Any) {
        let selectColorPopUpStoryboard = UIStoryboard(name: "selectColorPopUp", bundle: Bundle.main)
        guard let selectColorPopUp = selectColorPopUpStoryboard
            .instantiateViewController(withIdentifier: "selectColorPopUp") as? selectColorPopUp else {
                return
        }
        selectColorPopUp.selectColorPopUpDelegate = self
        selectColorPopUp.modalPresentationStyle = .custom
        selectColorPopUp.item_id = self.item_id
        present(selectColorPopUp,animated: true,completion: nil)
    }
    
    
    @IBAction func selectSize(_ sender: Any) {
        let selectSizePopUpStoryboard = UIStoryboard(name: "selectSizePopUp", bundle: Bundle.main)
        guard let selectSizePopUp = selectSizePopUpStoryboard
            .instantiateViewController(withIdentifier: "selectSizePopUp") as? selectSizePopUp else {
                return
        }
        selectSizePopUp.selectSizePopUpDelegate = self
        selectSizePopUp.modalPresentationStyle = .custom
        selectSizePopUp.item_id = self.item_id
        present(selectSizePopUp,animated: true,completion: nil)
    }
    
    
    @IBAction func insertToBasket(_ sender: Any) {
        let parameters:[String:Any?] = [
            "item_id" : self.item_id,
            "color" : self.item_color,
            "size" : self.item_size,
            "num" : Int(self.numStepper.value)
            
        ]
        basketDataManager().getUser(self, parameters: parameters)
    }
    
    
    @IBAction func pressedDismiss(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
    func pressedColorButton(color: String!) {
        self.item_color = color
        self.color.titleLabel?.text = color
    }
    func pressedSizeButton(size: String) {
        self.item_size = size
        self.size.titleLabel?.text = size
        self.itemView.isHidden = false
        var info:String = self.item_color + " / " + self.item_size
        self.selectedItemInfo.text = info
        
    }
    func pressedDismissButton() {
        //        self.selectPopUpDelegate.pressedDismissButton()
        self.dismiss(animated: false, completion: nil)
    }
    
    @objc func stepperValueChanged(stepper: GMStepper) {
        self.num.text = stepper.value as? String
        self.price.text = self.itemPrice
        
    }
}
