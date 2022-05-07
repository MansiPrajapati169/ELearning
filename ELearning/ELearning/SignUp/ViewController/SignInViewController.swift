//
//  SignInViewController.swift
//  ELearning
//
//  Created by Mansi Prajapati on 04/05/22.
//

import UIKit
import Alamofire

class SignInViewController: UIViewController {
    
    //MARK: - Variables
    let viewModel = SignInViewModel()
    
    //MARK: - Outlets
    @IBOutlet weak var txtPassword: CustomPasswordTextField!
    @IBOutlet weak var txtEmail: CustomTextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
   
    @IBOutlet weak var btnGoogle: CustomButtonLight!
    @IBOutlet weak var btnFacebook: CustomButtonLight!
    
    @IBOutlet weak var retriveClick: CustomButtonLight!
    @IBAction func deleteClick(_ sender: Any) {
        setData()
    }
    
    @IBAction func getUserData(_ sender: UIButton) {
        viewModel.getAllUsers()
    }
    
    //MARK: - ViewController LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        Helper.dismissKeyboard(view)
        txtEmail.delegate = self
        txtPassword.delegate = self
        bindViewModel()
    }
    
    //MARK: - IBActions
    @IBAction func signInClick(_ sender: UIButton) {
               
        if (self.validEmail(email: txtEmail.text) && self.checkEmpty(str:txtPassword.text, message: R.string.localizable.requiredPassword()) && self.passwordShort(str: txtPassword.text)) {
            activityIndicator.alpha = 0.8
            activityIndicator.startAnimating()
            setData()
        }
    }
    
    ///method calling for signin api
    private func setData() {
        let parameters = [
            "email": txtEmail.text ,
            "password": txtPassword.text
        ]
        viewModel.getData(txtEmail.text ?? "",txtPassword.text ?? "")
//        viewModel.signInAlamofire(url: Constant.loginApiUrl, requestData: parameters as Parameters, viewController: self)
        
        /// url session api call
//        guard let email = txtEmail.text else {return}
//        guard let password = txtPassword.text else {return}
//        let uploadDataModel = UserData(email: email,password: password)
//        viewModel.signIn(url: Constant.loginApiUrl, requestData: uploadDataModel, viewController: self)
    }
    
    ///observe response
    private func bindViewModel() {
        viewModel.signInData = { response in
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
          
                if let authVC = UIStoryboard(name: Constant.profileStroyBoard, bundle: nil).instantiateViewController(withIdentifier: Constant.profileIdentifier) as? ProfileViewController {
                    userHelper.isLoggedIn = true
                    self.navigationController?.pushViewController(authVC, animated: true)
                }
            }
        }
        
        viewModel.users = {[weak self] result in
            guard let self = self else { return }
            let data = result
            if let userListVC = UIStoryboard(name: Constant.authenticationStoryboard, bundle: nil).instantiateViewController(withIdentifier: Constant.userListIdentifier) as? UsersListViewController {
                userListVC.data = data
                let nav = UINavigationController(rootViewController: userListVC)
                nav.modalPresentationStyle = .pageSheet
                if let sheet = nav.sheetPresentationController {
                    sheet.detents = [.medium(), .large()]
                }
                self.present(nav, animated: true, completion: nil)
            }
            
        }
        
        viewModel.errorData = { error in
            self.activityIndicator.stopAnimating()
            self.showAlert(message: error.error)
        }
        
        viewModel.result = { [weak self] user in
            guard let self = self else { return }
            self.activityIndicator.stopAnimating()
            if let user = user {
                if let authVC = UIStoryboard(name: Constant.profileStroyBoard, bundle: nil).instantiateViewController(withIdentifier: Constant.profileIdentifier) as? ProfileViewController {
                    userHelper.isLoggedIn = true
                    self.navigationController?.pushViewController(authVC, animated: true)
                }
            } else {
                self.showAlert(message: "User not found")
            }
        }
    }
}

//MARK: - UITextFieldDelegate
extension SignInViewController: UITextFieldDelegate {
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            switch textField {
            case txtEmail:
                txtPassword.becomeFirstResponder()
            default:
                txtPassword.resignFirstResponder()
            }
            return true
        }
}
