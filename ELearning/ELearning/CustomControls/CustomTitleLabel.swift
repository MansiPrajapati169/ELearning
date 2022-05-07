//
//  CustomTitleLabel.swift
//  ELearning
//
//  Created by Mansi Prajapati on 09/05/22.
//

import UIKit

class CustomTitleLabel: UILabel {
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        updateTitleLabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        updateTitleLabel()
    }
    
    ///for setting custom properties of title label
    private func updateTitleLabel() {
        self.textColor = UIColor.textColorDark
        self.font = R.font.jostMedium(size: 16)
    }
}
