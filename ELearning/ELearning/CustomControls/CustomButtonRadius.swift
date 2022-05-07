//
//  U.swift
//  ELearning
//
//  Created by Mansi Prajapati on 07/05/22.
//

import UIKit

class CustomButtonRadius: UIButton {

    //MARK: - @IBInspectable
    @IBInspectable var cornerRadius: CGFloat = 18 {
        didSet {
            layer.cornerRadius = cornerRadius
            clipsToBounds = true
        }
    }
}
