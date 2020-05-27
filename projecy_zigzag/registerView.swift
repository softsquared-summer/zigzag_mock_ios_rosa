//
//  registerView.swift
//  projecy_zigzag
//
//  Created by 이진하 on 2020/05/26.
//  Copyright © 2020 이진하. All rights reserved.
//


import UIKit
import Alamofire
import BEMCheckBox



class registerView: UIViewController , UITextFieldDelegate, BEMCheckBoxDelegate{
     
    @IBOutlet weak var email: floatTextField!
    @IBOutlet weak var password: floatTextField!
    @IBOutlet weak var phone: floatTextField!
    @IBOutlet weak var chechBox: BEMCheckBox!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var inputViewBottomAnchor: NSLayoutConstraint!
    @IBOutlet weak var all_agree: BEMCheckBox!
    @IBOutlet weak var is_service_agree: BEMCheckBox!
    @IBOutlet weak var is_over_14: BEMCheckBox!
    @IBOutlet weak var is_alarm_agree: BEMCheckBox!
    @IBOutlet weak var is_privacy_agree: BEMCheckBox!
    
    let url = "http://15.164.29.242/user"
    var checkBoxes:[BEMCheckBox?] = []
    var isAgree:[String:String?] = [:]
    
    @IBAction func registUser(_ sender: Any) {
        let emailVal:String = email.text!
        let passwordVal:String = password.text!
        let phoneVal:String = phone.text!
    
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
        
        var parameters:[String:String?] = [
            "email" : emailVal,
            "password" : passwordVal,
            "phone" : phoneVal,
            "is_over_14" : isAgree["is_over_14"] ?? "Y" ,
            "is_service_agree" : isAgree["is_service_agree"] ?? "Y",
            "is_privacy_agree" : isAgree["is_privacy_agree"] ?? "Y" ,
            "is_alarm_agree" : isAgree["is_alarm_agree"] ?? "Y"
        ]
        let call = Alamofire.request(url, method: .post, parameters: parameters ,encoding:  JSONEncoding.default).responseJSON { (response) in
            if let value = response.result.value as? [String:AnyObject] {
                print(value["message"])
                if value["is_success"] as? Bool == true {
                    let alert = UIAlertController(title: "환영합니다!", message: "회원가입에 성공하였습니다!", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "확인", style: .default)
                    alert.addAction(okAction)
                    self.present(alert,animated: true,completion: nil)
 
                    }else {
                    let alert = UIAlertController(title: "error", message: value["message"] as! String, preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "확인", style: .default)
                    alert.addAction(okAction)
                    self.present(alert,animated: true,completion: nil)
                }
            }
        }
    }
    @IBOutlet weak var registBtn: UIButton!
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //bem checkbox delegate
        self.is_service_agree.delegate = self
        self.is_privacy_agree.delegate = self
        self.all_agree.delegate = self
        self.is_alarm_agree.delegate = self
        self.is_over_14.delegate = self
        
        //textField delegate
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
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
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
    //    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    //        self.contentView.endEditing(true)
    //        self.scrollView.endEditing(true)
    //    }
    //    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    //        textField.resignFirstResponder()
    //        return true
    //    }
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
extension UITextField {
    func addLeftPadding(){
        self.layer.borderWidth = 2.0
        self.layer.cornerRadius = 9.0
        self.layer.borderColor = UIColor.systemGray4.cgColor
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
    func editline(){
        self.layer.borderColor = CGColor.init(srgbRed: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.borderStyle = .roundedRect
    }
}
