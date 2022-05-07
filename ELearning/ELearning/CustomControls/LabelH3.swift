//
//  LabelH3.swift
//  ELearning
//
//  Created by Mansi Prajapati on 02/05/22.
//

import UIKit

class LabelH3: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
   }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        updateLabelH3()
    }
    
    func updateLabelH3() {
        self.textColor = UIColor(red: 0.432, green: 0.461, blue: 0.488, alpha: 1)
        self.font = UIFont(name: "Jost-Regular", size: 16)
    }
}
