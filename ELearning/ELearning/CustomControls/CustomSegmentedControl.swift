//
//  CustomSegmentedControl.swift
//  ELearning
//
//  Created by Mansi Prajapati on 06/05/22.
//

import UIKit
class CustomSegmentedControl: UISegmentedControl {
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        updateSegmentedControl()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        updateSegmentedControl()
    }
    
    ///For setting custom properties of label
    private func updateSegmentedControl() {
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.segmentLightColor, NSAttributedString.Key.font: R.font.jostMedium(size: 16)]
        self.setTitleTextAttributes(titleTextAttributes as [NSAttributedString.Key : Any], for: .normal)
        let titleSelectedTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.textColorDark]
        self.setTitleTextAttributes(titleSelectedTextAttributes as [NSAttributedString.Key : Any], for: .selected)
    }
    
    //MARK: - Override Method
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 12
        //self.bounds.size.height / 2.0
        layer.masksToBounds = true
        clipsToBounds = true
    }
}
