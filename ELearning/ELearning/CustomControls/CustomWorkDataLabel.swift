//
//  CustomWorkDataLabel.swift
//  ELearning
//
//  Created by Mansi Prajapati on 09/05/22.
//

import UIKit

class CustomWorkDataLabel: UILabel {
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        updateWorkDataLabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        updateWorkDataLabel()
    }
    
    ///for setting custom properties of label header 3
    private func updateWorkDataLabel() {
        self.textColor = UIColor.textColorDark
        self.font = R.font.jostRegular(size: 14)
    }
}
