//
//  registerView.swift
//  projecy_zigzag
//
//  Created by 이진하 on 2020/05/26.
//  Copyright © 2020 이진하. All rights reserved.
//


import UIKit


class registerView: UIViewController , UITextFieldDelegate{
    

    @IBOutlet weak var email: floatTextField!
    @IBOutlet weak var password: floatTextField!
    @IBOutlet weak var phone: floatTextField!
    @IBOutlet weak var verify: floatTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        verify.addLeftPadding()
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
