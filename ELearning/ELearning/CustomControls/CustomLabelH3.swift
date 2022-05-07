//
//  LabelH3.swift
//  ELearning
//
//  Created by Mansi Prajapati on 02/05/22.
//

import UIKit

class CustomLabelH3: UILabel {
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        updateLabelH3()
    }
    
    ///for setting custom properties of label header 3
    private func updateLabelH3() {
        self.textColor = UIColor.textColorLight
        self.font = R.font.jostRegular(size: 16)
    }
}
