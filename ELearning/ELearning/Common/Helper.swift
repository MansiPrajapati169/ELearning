//
//  Helper.swift
//  ELearning
//
//  Created by Mansi Prajapati on 04/05/22.
//

import Foundation
import UIKit

class Helper : UIViewController {
    
    ///for showing alert
    static func showAlert(message: String, viewController: UIViewController) {
         let alertController = UIAlertController(title: NSLocalizedString("Alert!", comment: ""), message: message, preferredStyle: .alert)
         alertController.addAction(UIAlertAction(title: NSLocalizedString("Dismiss", comment: ""), style: .default))
         viewController.present(alertController, animated: true, completion: nil)
     }
    
    ///for dismissing keyboard
    static func dismissKeyboard (_ view: UIView) {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
         view.addGestureRecognizer(tap)
    }
    
    static func validEmail (email: String?, viewController: UIViewController) -> Bool {
        let regularExpressionForEmail = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let testEmail = NSPredicate(format:"SELF MATCHES %@", regularExpressionForEmail)
        var isEmailValid = false
        switch true {
        case email?.isEmpty:
                Helper.showAlert(message: "Email Required", viewController: viewController)
        case testEmail.evaluate(with: email):
            isEmailValid = true
            break
        default:
            Helper.showAlert(message: "Enter valid email", viewController: viewController)
        }
        return isEmailValid
    }
    
    static func checkEmpty(str: String?,message: String,viewController: UIViewController) -> Bool {
        var notEmpty = false
        switch true {
        case str?.isEmpty:
                Helper.showAlert(message: message, viewController: viewController)
        default:
            notEmpty = true
            break
        }
        return notEmpty
    }
    
    static func passwordShort(str: String?,viewController: UIViewController) -> Bool {
        var notShort = false
        switch true {
        case str?.count ?? 0 < 8:
                Helper.showAlert(message:"Password is too short", viewController: viewController)
        default:
            notShort = true
            break
        }
        return notShort
    }
}
