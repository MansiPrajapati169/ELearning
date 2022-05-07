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
        Helper.showAlert(message: R.string.localizable.userLoginSucessful(), viewController: self)
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
