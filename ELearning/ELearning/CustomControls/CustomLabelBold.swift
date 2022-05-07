//
//  CustomLabelBold.swift
//  ELearning
//
//  Created by Mansi Prajapati on 05/05/22.
//

import UIKit

class CustomLabelBold: UILabel {
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        updateLabelBold()
    }
    
    fileprivate func updateLabelBold() {
        self.textColor = UIColor.textColorDark
        self.font = R.font.poppinsBold(size: 20)
    }
}

