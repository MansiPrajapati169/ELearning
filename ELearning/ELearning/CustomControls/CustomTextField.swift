//
//  CustomTextField.swift
//  ELearning
//
//  Created by Mansi Prajapati on 30/04/22.
//

import UIKit

class CustomTextField: UITextField {
    
    //MARK: - Variables
    private var textPadding = UIEdgeInsets(top: 12, left: 13.29, bottom: 12, right: 13.29)
    private var leftPadding: CGFloat = 20
    
    //MARK: - Override Methods
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }

    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += leftPadding
        return textRect
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        updateTextField()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        updateTextField()
    }
    
    func updateTextField() {
        self.layer.cornerRadius = 18
        self.layer.masksToBounds = true
        let placeholderStr = placeholder ?? ""
        attributedPlaceholder = NSAttributedString(string: placeholderStr, attributes: [NSAttributedString.Key.foregroundColor: UIColor.placeHolderColor as Any, NSAttributedString.Key.font : R.font.jostLight(size: 12) ?? 14])
    }
    
    //MARK: - IBInspectable
    @IBInspectable var leftImage: UIImage? {
        didSet {
            updateLeftImage()
        }
    }
    
    ///for upadting textField

    func updateLeftImage() {
        if let image = leftImage
        {
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            leftViewMode = UITextField.ViewMode.always
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            leftView = imageView
        }
        else {
            leftViewMode = UITextField.ViewMode.never
            leftView = nil
        }
    }
}
