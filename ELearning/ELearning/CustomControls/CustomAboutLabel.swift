//
//  CustomAboutLabel.swift
//  ELearning
//
//  Created by Mansi Prajapati on 09/05/22.
//

import UIKit

class CustomAboutLabel: CustomProfileLabel {
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        updateAboutLabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        updateAboutLabel()
    }
    
    //MARK: - IBInspectable
    @IBInspectable var ifSeeMore: Bool = false {
        didSet {
            if ifSeeMore {
                self.textColor = UIColor.buttonColor
                self.font = R.font.jostSemiBold(size: 16)
            }
            else {
                self.textColor = UIColor.profileLabelColor
            }
        }
    }
    
    ///for setting custom properties of About Label
    private func updateAboutLabel() {
        self.font = R.font.jostRegular(size: 16)
    }
}
