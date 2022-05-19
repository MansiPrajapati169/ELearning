//
//  LableRegular.swift
//  ELearning
//
//  Created by Mansi Prajapati on 02/05/22.
//

import UIKit

class LabelRegular: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
   }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        updateLabelH3()
    }
    
    fileprivate func updateLabelH3() {
        self.textColor = UIColor(red: 0.051, green: 0.09, blue: 0.191, alpha: 1)
        self.font = UIFont(name: "Poppins-Regular", size: 14)
    }
}
