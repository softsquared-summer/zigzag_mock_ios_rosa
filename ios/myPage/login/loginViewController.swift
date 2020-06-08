//
//  SplashViewController.swift
//  ios
//
//  Created by Jerry Jung on 07/08/2019.
//  Copyright © 2019 Jerry Jung. All rights reserved.
//

import UIKit


@available(iOS 13.0, *)
class loginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var email: floatTextField!
    @IBOutlet weak var password: floatTextField!
    var isLogin:Bool = false
    @IBAction func login(_ sender: Any) {
        guard  let emailVal = email.text as String?, let pwVal = password.text as String? else { return }
        print(emailVal,pwVal)
        let parameters:[String:String?] = [
            "email" : emailVal,
            "password" : pwVal
        ]
        loginDataManager().getUser(self, parameters: parameters)
        
        if emailVal.isValidEmail() == false {
            self.presentAlert(title: "아이디 오류", message: "잘못된 형식의 아이디 입니다!")
        }
        
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationItem.rightBarButtonItem = registerBarButtonItem

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
    
    @objc func addTapped(_ sender: Any) {
        guard let navigationViewController = self.navigationController else {
            self.presentAlert(title: "오류", message: "화면 이동에 실패하였습니다.")
            return
        }
        navigationViewController.pushViewController(registerViewController(), animated: true)
    }
    
    lazy var registerBarButtonItem: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(title: "회원가입", style: .plain, target: self, action: #selector(addTapped))
        barButtonItem.image = UIImage(named: "register-1")
        barButtonItem.tintColor = UIColor.red
        return barButtonItem
    }()
}

