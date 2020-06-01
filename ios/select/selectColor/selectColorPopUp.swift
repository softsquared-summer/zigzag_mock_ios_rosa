//
//  selectColorPopUp.swift
//  ios
//
//  Created by 이진하 on 2020/06/01.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class selectColorPopUp:  BaseViewController{

    var item_id:Int = 0
    var item_color:String! = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        selectColorDataManager().getDetail(self,item_id : item_id)
    }
     @IBOutlet weak var color1: UIButton!
    @IBOutlet weak var color2: UIButton!
    @IBOutlet weak var color3: UIButton!
   var selectColorPopUpDelegate:selectColorPopUpDelegate!

    @IBAction func selectColor1(_ sender: UIButton) {
        self.item_color = self.color1.titleLabel?.text
        self.selectColorPopUpDelegate.pressedColorButton(color: item_color)
        self.dismiss(animated: false, completion: nil)
    }
    @IBAction func selectColor2(_ sender: UIButton) {
        self.item_color = self.color2.titleLabel?.text
        self.selectColorPopUpDelegate.pressedColorButton(color: item_color)
        self.dismiss(animated: false, completion: nil)
    }
    @IBAction func selectColor3(_ sender: UIButton) {
        self.item_color = self.color3.titleLabel?.text
        self.selectColorPopUpDelegate.pressedColorButton(color: item_color)
        self.dismiss(animated: false, completion: nil)
    }
}
