//
//  SignInViewController.swift
//  ELearning
//
//  Created by Mansi Prajapati on 04/05/22.
//

import UIKit

class SignInViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var txtPassword: CustomPasswordTextField!
    @IBOutlet weak var txtEmail: CustomTextField!
    
    //MARK: - ViewController LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        Helper.dismissKeyboard(view)
        txtEmail.delegate = self
        txtPassword.delegate = self
    }
    
    //MARK: - IBActions
    @IBAction func signInClick(_ sender: UIButton) {
        if (Helper.validEmail(email: txtEmail.text, viewController: self) && Helper.checkEmpty(str:txtPassword.text, message: "Password required", viewController: self) && Helper.passwordShort(str: txtPassword.text, viewController: self)) {
            if let thirdViewController = UIStoryboard(name: Constant.profileStroyBoard, bundle: nil).instantiateViewController(withIdentifier: Constant.profileIdentifier) as? ProfileViewController {
                       navigationController?.pushViewController(thirdViewController, animated: true)
                   }
        }
    }
}

//MARK: - UITextFieldDelegate
extension SignInViewController: UITextFieldDelegate {
        func textFieldShouldReturn(_ textField: UITextField) -> Bool
        {
            switch textField {
            case txtEmail:
                txtPassword.becomeFirstResponder()
            default:
                txtPassword.resignFirstResponder()
            }
            return true
        }
}
