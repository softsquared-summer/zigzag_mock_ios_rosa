//
//  floaTextField.swift
//  ios
//
//  Created by 이진하 on 2020/05/29.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class floatTextField: UITextField {
    var floatingLabel: UILabel = UILabel(frame: CGRect.zero) // Label
    var floatingLabelHeight: CGFloat = 14 // Default height
    var changedText:String = ""
    var originText:String = ""
    @IBInspectable
    var _placeholder: String? // we cannot override 'placeholder'
    @IBInspectable
    var floatingLabelColor: UIColor = UIColor.black {
        didSet {
            self.floatingLabel.textColor = floatingLabelColor
            self.setNeedsDisplay()
        }
    }
    @IBInspectable
    var activeBorderColor: UIColor = UIColor.blue
    @IBInspectable
    var floatingLabelFont: UIFont = UIFont.systemFont(ofSize: 14) {
        didSet {
            self.floatingLabel.font = self.floatingLabelFont
            self.font = self.floatingLabelFont
            self.setNeedsDisplay()
        }
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self._placeholder = (self._placeholder != nil) ? self._placeholder : placeholder // Use our custom placeholder if none is set
        placeholder = self._placeholder // make sure the placeholder is shown
        self.floatingLabel.text = self.originText
        self.floatingLabel = UILabel(frame: CGRect.zero)
        self.floatingLabel.textColor = floatingLabelColor
        self.floatingLabel.font = floatingLabelFont
        self.floatingLabel.layer.backgroundColor = UIColor.white.cgColor
        self.floatingLabel.translatesAutoresizingMaskIntoConstraints = false
        self.floatingLabel.clipsToBounds = true
        self.floatingLabel.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.floatingLabelHeight)
        self.layer.borderColor = self.activeBorderColor.cgColor
        self.addSubview(self.floatingLabel)
        self.floatingLabel.bottomAnchor.constraint(equalTo:
            self.topAnchor, constant: -10).isActive = true
        

    }
    
    @objc func endEditFloatingLabel() {
        if self.text != "" {
            self.floatingLabel.textColor = UIColor.systemGray4
        }
        self.setNeedsDisplay()
    }
    
}

@available(iOS 13.0, *)
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
