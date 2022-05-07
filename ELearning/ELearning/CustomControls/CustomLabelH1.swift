//
//  LabelH1.swift
//  ELearning
//
//  Created by Mansi Prajapati on 02/05/22.
//

import UIKit

class CustomLabelH1: UILabel {
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        updateLabel()
    }
    
    /// for setting custom properties of label header 1
    private func updateLabel() {
        self.textColor = UIColor.textColorDark
        self.font = R.font.poppinsMedium(size: 26)
    }
}
