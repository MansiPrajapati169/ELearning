//
//  CustomButton.swift
//  ELearning
//
//  Created by Mansi Prajapati on 30/04/22.
//

import UIKit

class CustomButton: CustomButtonRadius {

    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        updateButton()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        updateButton()
    }
    
    /// update button's attributes
    private func updateButton() {
        self.layer.cornerRadius = cornerRadius
        self.titleLabel?.font = R.font.jostMedium(size: 16)
        self.setTitleColor(.white, for: .normal)
        self.backgroundColor = UIColor.buttonColor
    }
}

