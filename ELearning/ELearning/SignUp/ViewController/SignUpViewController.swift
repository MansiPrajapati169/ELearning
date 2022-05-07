//
//  SignUpViewController.swift
//  ELearning
//
//  Created by Mansi Prajapati on 04/05/22.
//

import UIKit
import Alamofire

class SignUpViewController: UIViewController {
    
    //MARK: - Variables
    private let viewModel = SignUpViewModel()
    
    //MARK: - Outlets
    @IBOutlet weak var txtPassword: CustomPasswordTextField!
    @IBOutlet weak var txtEmail: CustomTextField!
    @IBOutlet weak var txtName: CustomTextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK: - ViewController LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    //MARK: - IBActions
    @IBAction func signUpClick(_ sender: UIButton) {
        if (self.checkEmpty(str:txtName.text,message: R.string.localizable.requiredName()) && self.validEmail(email: txtEmail.text) &&
            self.checkEmpty(str:txtPassword.text,message: R.string.localizable.requiredPassword()) &&
            self.passwordShort(str: txtPassword.text)) {
            activityIndicator.alpha = 0.8
            activityIndicator.startAnimating()
            setData()
        }
    }
    
    ///setData
    private func setData() {
        Helper.dismissKeyboard(view)
        txtName.delegate = self
        txtEmail.delegate = self
        txtPassword.delegate = self
        let parameters = [
            "email": txtEmail.text ,
            "password": txtPassword.text
        ]
        
        /// url session api call
//        guard let email = txtEmail.text else {return}
//        guard let password = txtPassword.text else {return}
//        let uploadDataModel = UserData(email: email,password: password)
//        viewModel.signUp(url: Constant.addUserUrl, requestData: uploadDataModel, viewController: self)
          viewModel.signUpAlamofire(url: Constant.addUserUrl, requestData: parameters as Parameters, viewController: self)
    }
    
    private func bindViewModel() {
        viewModel.signUpData = { response in
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                if let profileVC = UIStoryboard(name: Constant.profileStroyBoard, bundle: nil).instantiateViewController(withIdentifier: Constant.profileIdentifier) as? ProfileViewController {
                    UserDefaults.standard.set(true, forKey: Constant.loggedKey)
                    self.navigationController?.pushViewController(profileVC, animated: true)
                }
            }
        }
        
        viewModel.errorData = { error in
           self.activityIndicator.stopAnimating()
           self.showAlert(message: error.error)
        }
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
