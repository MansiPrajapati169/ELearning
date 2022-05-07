//
//  LableRegular.swift
//  ELearning
//
//  Created by Mansi Prajapati on 02/05/22.
//

import UIKit

class CustomLabelRegular: UILabel {
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        updateLabelRegular()
    }
    
    ///For setting custom properties of label
    private func updateLabelRegular() {
        self.textColor = UIColor.textColorDark
        self.font = R.font.poppinsRegular(size: 14)
    }
}
