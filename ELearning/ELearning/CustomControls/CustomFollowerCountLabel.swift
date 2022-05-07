//
//  CustomLabelNavigationTitle.swift
//  ELearning
//
//  Created by Mansi Prajapati on 09/05/22.
//

import UIKit

class CustomFollowerCountLabel: UILabel {
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        updateFollowerCount()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        updateFollowerCount()
    }
    
    ///for setting custom properties of update follower count
    private func updateFollowerCount() {
        self.textColor = UIColor.textColorDark
        self.font = R.font.poppinsSemiBold(size: 22)
    }
}
