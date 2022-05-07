//
//  CustomProfileLabel.swift
//  ELearning
//
//  Created by Mansi Prajapati on 09/05/22.
//

import UIKit

class CustomProfileLabel: UILabel {
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        updateProfileLabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        updateProfileLabel() 
    }
    
    ///for setting custom properties of label header 3
    private func updateProfileLabel() {
        self.textColor = UIColor.profileLabelColor
        self.font = R.font.jostRegular(size: 12)
    }
}
