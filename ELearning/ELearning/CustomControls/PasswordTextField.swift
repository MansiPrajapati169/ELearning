//
//  PasswordTextField.swift
//  ELearning
//
//  Created by Mansi Prajapati on 02/05/22.
//

import UIKit

class PasswordTextField: CustomTextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        rightIcon()
    }
    
    public func rightIcon() {
        let passwordButton = UIButton()
        passwordButton.tintColor = UIColor.gray
        passwordButton.setImage(UIImage(systemName: "eye"), for: .normal)
        passwordButton.setImage(UIImage(systemName: "eye.slash"), for: .selected)
        passwordButton.addTarget(self, action: #selector(onEyeButtonClicked), for: .touchUpInside)
        passwordButton.isSelected = true
        passwordButton.frame = CGRect(x: 0, y: 0, width: 15, height: 12)
        self.rightViewMode = .always
        self.rightView?.backgroundColor = UIColor.black
        self.rightView = passwordButton

    }
    
    @objc func onEyeButtonClicked(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        self.isSecureTextEntry = sender.isSelected
    }
    
    var imageRightPadding: CGFloat = -25
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.rightViewRect(forBounds: bounds)
        return rect.inset(by: UIEdgeInsets(top: 0, left:imageRightPadding,bottom:0,right:0))
    }
}
