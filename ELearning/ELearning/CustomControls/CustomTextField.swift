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
    private var color: UIColor = UIColor.lightGray
    private var placeholderColor: UIColor = UIColor.placeHolderColor
    
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
    
    public override var placeholder: String? {
        didSet {
            let placeholderStr = placeholder ?? ""
            attributedPlaceholder = NSAttributedString(string: placeholderStr, attributes: [NSAttributedString.Key.foregroundColor: placeholderColor as Any])
        }
    }
    
    //MARK: - IBInspectable
    @IBInspectable var leftImage: UIImage? {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        if let image = leftImage
        {
            leftViewMode = UITextField.ViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            imageView.tintColor = color
            leftView = imageView
        }
        else {
            leftViewMode = UITextField.ViewMode.never
            leftView = nil
        }
        self.layer.cornerRadius = 18
        let placeholderStr = placeholder ?? ""
        attributedPlaceholder = NSAttributedString(string: placeholderStr, attributes: [NSAttributedString.Key.foregroundColor: placeholderColor as Any])
    }
}
