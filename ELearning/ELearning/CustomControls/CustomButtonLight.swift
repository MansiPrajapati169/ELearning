//
//  LabelRegularLight.swift
//  ELearning
//
//  Created by Mansi Prajapati on 02/05/22.
//

import UIKit

class CustomButtonLight: UIButton {
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        updateButtonLight()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        updateButtonLight()
    }
    
    //MARK: - IBInspectable
    @IBInspectable var isForgotPassword: Bool = false {
        didSet {
            if isForgotPassword {
                self.setTitleColor(UIColor.textColorLight, for: .normal)
                let attrs = [NSAttributedString.Key.underlineStyle : 1]
                let attributedString = NSMutableAttributedString(string: R.string.localizable.forgotPassword(), attributes:attrs)
                self.setAttributedTitle(attributedString, for: .normal)
            }
            else {
                self.setTitleColor(UIColor.textColorDark, for: .normal)
            }
        }
    }
    
    ///For setting custom properties of button
    private func updateButtonLight() {
        self.titleLabel?.font = R.font.poppinsRegular(size: 14)
        self.setTitleColor(UIColor.textColorDark, for: .normal)
    }
}
