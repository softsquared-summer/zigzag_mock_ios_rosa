//
//  registerViewController.swift
//  ios
//
//  Created by 이진하 on 2020/05/29.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit
import BEMCheckBox

@available(iOS 13.0, *)
class registerViewController: UIViewController , UITextFieldDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var email: floatTextField!
    @IBOutlet weak var password: floatTextField!
    @IBOutlet weak var phone: floatTextField!
    @IBOutlet weak var all_agree: BEMCheckBox!
    @IBOutlet weak var is_service_agree: BEMCheckBox!
    @IBOutlet weak var is_privacy_agree: BEMCheckBox!
    @IBOutlet weak var is_alarm_agree: BEMCheckBox!
    @IBOutlet weak var registBtn: UIButton!
    @IBOutlet weak var is_over_14: BEMCheckBox!
    
    @IBAction func registUser(_ sender: Any) {
        
        guard  let emailVal = email.text as String?,
            let pwVal = password.text as String?,
            let phoneVal = phone.text as String? else { return }
        
        if is_service_agree.on == true {
            isAgree["is_service_agree"] = "Y"
        }else{ isAgree["is_service_agree"] = "N"}
        if is_over_14.on == true {
            isAgree["is_over_14"] = "Y"
        }else{ isAgree["is_over_14"] = "N" }
        if is_privacy_agree.on == true {
            isAgree["is_privacy_agree"] = "Y"
        }else{ isAgree["is_privacy_agree"] = "N"}
        if is_alarm_agree.on == true {
            isAgree["is_alarm_agree"] = "Y"
        }else{ isAgree["is_alarm_agree"] = "N"}
        
        let parameters:[String:String?] = [
            "email" : emailVal,
            "password" : pwVal,
            "phone" : phoneVal,
            "is_over_14" : isAgree["is_over_14"] ?? "Y" ,
            "is_service_agree" : isAgree["is_service_agree"] ?? "Y",
            "is_privacy_agree" : isAgree["is_privacy_agree"] ?? "Y" ,
            "is_alarm_agree" : isAgree["is_alarm_agree"] ?? "Y"
        ]
        registerDataManager().getRegister(self, parameters: parameters)
    }
    var checkBoxes:[BEMCheckBox?] = []
    var isAgree:[String:String?] = [:]
    override func viewDidLoad() {
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "backButton")
            self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "backButton")
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        super.viewDidLoad()
        self.is_service_agree.delegate = self
        self.is_privacy_agree.delegate = self
        self.all_agree.delegate = self
        self.is_alarm_agree.delegate = self
        self.is_over_14.delegate = self
        
        self.email.delegate = self
        self.password.delegate = self
        self.phone.delegate = self
        
        email.addLeftPadding()
        email.addTarget(self, action: #selector(isEditing(floatTextField: )), for: .editingDidBegin)
        email.addTarget(self, action: #selector(endEditing(floatTextField:)), for: .editingDidEnd)
        email.originText = "이메일"
        email.floatingLabel.text = "이메일"
        email.changedText = "올바른 형식의 이메일을 입력해주세요."
        
        password.addLeftPadding()
        password.addTarget(self, action: #selector(isEditing(floatTextField: )), for: .editingDidBegin)
        password.addTarget(self, action: #selector(endEditing(floatTextField:)), for: .editingDidEnd)
        password.originText = "비밀번호"
        password.floatingLabel.text = "비밀번호"
        password.changedText = "비밀번호를 입력해주세요."
        
        phone.addLeftPadding()
        phone.addTarget(self, action: #selector(isEditing(floatTextField: )), for: .editingDidBegin)
        phone.addTarget(self, action: #selector(endEditing(floatTextField:)), for: .editingDidEnd)
        phone.originText = "휴대폰 번호"
        phone.floatingLabel.text = "휴대폰 번호"
        phone.changedText="올바른 휴대폰 번호를 입력해주세요."
        
        self.registBtn.layer.cornerRadius = 20.0
        //
        //        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        //        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        checkBoxes = [is_over_14 , is_alarm_agree, is_privacy_agree,is_service_agree]
        self.all_agree.onFillColor = UIColor(displayP3Red: 247/255, green: 37/255, blue: 133/255, alpha: 1)
        self.all_agree.onCheckColor = UIColor.white
        self.all_agree.onTintColor = UIColor.white
        self.all_agree.offFillColor = UIColor.systemGray4
        self.all_agree.tintColor = UIColor.white
        for box in checkBoxes {
            box?.onFillColor = UIColor(displayP3Red: 247/255, green: 37/255, blue: 133/255, alpha: 1)
            box?.onCheckColor = UIColor.white
            box?.onTintColor = UIColor.white
            box?.offFillColor = UIColor.systemGray4
            box?.tintColor = UIColor.white
        }
    }
    
    @objc func keyboardWillShow(_ sender:Notification){
        guard let userInfo = sender.userInfo as? [String:Any] else {return}
        guard let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {return}
        self.scrollView.transform = CGAffineTransform(translationX: 0, y: -keyboardFrame.cgRectValue.height + 60)
    }
    
    @objc func keyboardWillHide(_ sender:Notification){
        self.scrollView.transform = .identity
    }
    
    //textField focused
    @objc func isEditing(floatTextField: floatTextField){
        floatTextField.layer.borderWidth = 2.0
        floatTextField.layer.cornerRadius = 9.0
        floatTextField.layer.borderColor = UIColor.systemGray.cgColor
        floatTextField.floatingLabel.text =  floatTextField.originText
        floatTextField.floatingLabel.textColor = UIColor.systemGray
    }
    //end editing
    @objc func endEditing(floatTextField: floatTextField){
        var empty:Bool = false
        floatTextField.layer.borderWidth = 2.0
        floatTextField.layer.cornerRadius = 9.0
        floatTextField.layer.borderColor = UIColor.systemGray4.cgColor
        if floatTextField.text == "" {
            floatTextField.layer.borderColor = UIColor.red.cgColor
            floatTextField.floatingLabel.textColor = UIColor.red
            floatTextField.floatingLabel.text =  floatTextField.changedText
        }else if floatTextField.text != ""{
            floatTextField.floatingLabel.textColor = UIColor.systemGray
            floatTextField.floatingLabel.text =  floatTextField.originText
        }
        btnEnable()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if(string == "\n"){
            textField.resignFirstResponder()
        }
        return true
    }
    func btnEnable(){
        if email.text == ""{
            registBtn.isEnabled = false
            
        }else{
            registBtn.isEnabled = true
            registBtn.backgroundColor = UIColor(displayP3Red: 247/255, green: 37/255, blue: 133/255, alpha: 1)
        }
    }
}

@available(iOS 13.0, *)
extension registerViewController: BEMCheckBoxDelegate{
    
    func didTap(_ checkBox: BEMCheckBox) {
        let currentTag = checkBox.tag
        
        if checkBox == all_agree {
            if all_agree.on == true {
                for box in checkBoxes {
                    box!.on = true
                }
            }else if all_agree.on == false{
                for box in checkBoxes {
                    box!.on = false
                }
            }
        }else {
            for box in checkBoxes where box!.tag != currentTag {
                box!.on = false
            }
        }
        print(checkBox.on)
    }
}

