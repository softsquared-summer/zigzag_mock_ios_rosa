//
//  loginView.swift
//  projecy_zigzag
//
//  Created by 이진하 on 2020/05/27.
//  Copyright © 2020 이진하. All rights reserved.
//

import UIKit
import Alamofire

class loginView: UIViewController, UITextFieldDelegate {
    let loginUrl = "http://15.164.29.242/login"
    
    @IBOutlet weak var email: floatTextField!
    @IBOutlet weak var password: floatTextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBAction func login(_ sender: Any) {
        guard  let emailVal = email.text, let pwVal = password.text else { return }
        var parameters:[String:String?] = [
            "email" : emailVal,
            "password" : pwVal
        ]
        Alamofire.request(loginUrl, method: .post
            , parameters: parameters, encoding: JSONEncoding.default).responseJSON { (response) in
                if let value = response.result.value as? [String:AnyObject] {
                    
                    if value["is_success"] as? Bool == true {
                        UserDefaults.standard.set(emailVal, forKey:"userEmail" )
                        let alert = UIAlertController(title: "환영합니다!", message: "로그인에 성공하였습니다!", preferredStyle: .alert)
                        let okAction = UIAlertAction(title: "확인", style: .default)
                        alert.addAction(okAction)
                        self.present(alert,animated: true,completion: nil)
                        print(value)
                        print(UserDefaults.standard.value(forKey: "userEmail"))
                    }
                }
        }
    }
    @IBAction func forgotPw(_ sender: Any) {
    }
    override func viewDidLoad() {
        self.email.delegate = self
        self.password.delegate = self
        
        email.addLeftPadding()
        email.addTarget(self, action: #selector(isEditing(floatTextField: )), for: .editingDidBegin)
        email.addTarget(self, action: #selector(endEditing(floatTextField:)), for: .editingDidEnd)
        email.originText = "이메일"
        email.floatingLabel.text = "이메일"
        password.addLeftPadding()
        password.addTarget(self, action: #selector(isEditing(floatTextField: )), for: .editingDidBegin)
        password.addTarget(self, action: #selector(endEditing(floatTextField:)), for: .editingDidEnd)
        password.originText = "비밀번호"
        password.floatingLabel.text = "비밀번호"
        loginBtn.layer.cornerRadius = 20.0
        super.viewDidLoad()       
    }
    @objc func isEditing(floatTextField: floatTextField){
        floatTextField.layer.borderWidth = 2.0
        floatTextField.layer.cornerRadius = 9.0
        floatTextField.layer.borderColor = UIColor.systemGray.cgColor
        floatTextField.floatingLabel.text =  floatTextField.originText
        floatTextField.floatingLabel.textColor = UIColor.systemGray
    }
    //end editing
    @objc func endEditing(floatTextField: floatTextField){        floatTextField.layer.borderWidth = 2.0
        floatTextField.layer.cornerRadius = 9.0
        floatTextField.layer.borderColor = UIColor.systemGray4.cgColor
        floatTextField.floatingLabel.textColor = UIColor.systemGray
        floatTextField.floatingLabel.text =  floatTextField.originText
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
            loginBtn.isEnabled = false
            
        }else{
            loginBtn.isEnabled = true
            loginBtn.backgroundColor = UIColor(displayP3Red: 247/255, green: 37/255, blue: 133/255, alpha: 1)
        }
    }
}
extension UITextField{
    
}
