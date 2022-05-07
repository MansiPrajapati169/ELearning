//
//  SignUpViewController.swift
//  ELearning
//
//  Created by Mansi Prajapati on 04/05/22.
//

import UIKit

class SignUpViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var txtPassword: CustomPasswordTextField!
    @IBOutlet weak var txtEmail: CustomTextField!
    @IBOutlet weak var txtName: CustomTextField!
    
    //MARK: - ViewController LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setData()
    }
    
    //MARK: - IBActions
    @IBAction func signUpClick(_ sender: UIButton) {
        if (Helper.checkEmpty(str:txtName.text,message: "Username required", viewController: self) && Helper.validEmail(email: txtEmail.text, viewController: self) &&
            Helper.checkEmpty(str:txtPassword.text,message: "Password required", viewController: self) &&
            Helper.passwordShort(str: txtPassword.text, viewController: self)) {
            Helper.showAlert(message: R.string.localizable.userRegisterd(), viewController: self)
        }
    }
    
    fileprivate func setData() {
        Helper.dismissKeyboard(view)
        txtName.delegate = self
        txtEmail.delegate = self
        txtPassword.delegate = self
    }
}

//MARK: - UITextFieldDelegate
extension SignUpViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case txtName:
            txtEmail.becomeFirstResponder()
        case txtEmail:
            txtPassword.becomeFirstResponder()
        default:
            txtPassword.resignFirstResponder()
        }
        return true
    }
}
