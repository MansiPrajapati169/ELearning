//
//  CustomProfileButton.swift
//  ELearning
//
//  Created by Mansi Prajapati on 09/05/22.
//

import UIKit

class CustomProfileButton: CustomButtonRadius {
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        updateButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        updateButton()
    }
    
    //MARK: - IBInspectable
    @IBInspectable var isNormalButton: Bool = false {
        didSet {
            if isNormalButton {
                self.backgroundColor = UIColor.buttonColor
                self.setTitleColor(.white, for: .normal)
            }
            else {
                self.backgroundColor = UIColor.white
                self.setTitleColor(.textColorDark, for: .normal)
                //self.layer.borderWidth = 1
                self.layer.borderColor = UIColor.buttonBorderColor?.cgColor
            }
        }
    }
    
    /// update button's attributes
    private func updateButton() {
        self.titleLabel?.font = R.font.jostRegular(size: 16)
        self.setTitleColor(.white, for: .normal)
        self.backgroundColor = UIColor.buttonColor
    }
}
