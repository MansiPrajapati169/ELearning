//
//  Helper.swift
//  ELearning
//
//  Created by Mansi Prajapati on 04/05/22.
//

import Foundation
import UIKit
class Helper : UIViewController {
    
    
    /// show alert
    static func showAlert(message: String, viewController: UIViewController) {
         let alertController = UIAlertController(title: NSLocalizedString("Alert!", comment: ""), message: message, preferredStyle: .alert)
         alertController.addAction(UIAlertAction(title: NSLocalizedString("Dismiss", comment: ""), style: .default))
         viewController.present(alertController, animated: true, completion: nil)
     }
    
    
    /// keyboard dismiss
    static func dismissKeyboard (_ view: UIView) {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
         view.addGestureRecognizer(tap)
    }
}
