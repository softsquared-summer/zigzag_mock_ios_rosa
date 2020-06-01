//
//  selectSizePopUp.swift
//  ios
//
//  Created by 이진하 on 2020/06/01.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class selectSizePopUp:  BaseViewController{

    var item_id:Int! = 0
    var item_size:String! = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        selectSizeDataManager().getDetail(self,item_id: item_id)
    }
    override func viewWillDisappear(_ animated: Bool) {
        
    }
    @IBOutlet weak var size1: UIButton!
    @IBOutlet weak var size2: UIButton!
    @IBOutlet weak var size3: UIButton!
    
    
    @IBAction func selectSize1(_ sender: Any) {
        self.item_size = self.size1.titleLabel?.text
        self.selectSizePopUpDelegate.pressedSizeButton(size: item_size)
        print(item_size)
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func selectSize2(_ sender: Any) {
        self.item_size = self.size2.titleLabel?.text
        self.selectSizePopUpDelegate.pressedSizeButton(size: item_size)
               print(item_size)
               self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectSize3(_ sender: Any) {
        self.item_size = self.size3.titleLabel?.text
        self.selectSizePopUpDelegate.pressedSizeButton(size: item_size)
        print(item_size)
        self.dismiss(animated: true, completion: nil)
    }
    var selectSizePopUpDelegate:selectSizePopUpDelegate!
       @IBAction func pressedDismiss(_ sender: UIButton) {
//           self.selectSizePopUpDelegate.pressedDismissButton()
           self.dismiss(animated: false, completion: nil)
       }

}
