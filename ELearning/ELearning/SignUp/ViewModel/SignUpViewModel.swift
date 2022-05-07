//
//  SignInViewModel.swift
//  ELearning
//
//  Created by Mansi Prajapati on 25/05/22.
//

import UIKit
import Alamofire

let userDb = UserRegisterDAO()
class SignUpViewModel {
    
    //MARK: - Variables
    var signUpData: ((SignUpResponse) -> Void)?
    var errorData: ((ErrorResponse) -> Void)?
    var result: ((Bool) -> Void)?
    var delete: ((Bool) -> Void)?
    
    ///api calling signup
    func signUp(url: String,requestData: UserData,viewController: UIViewController) {
        guard let jsonData = try? JSONEncoder().encode(requestData) else {
            return
        }
        
        Helper.request(url: url, method: Constant.post,requestData: jsonData, responseClass: SignUpResponse.self,responseCode: 200,onSuccess: { response in
            DispatchQueue.main.async {
                if let profileVC = UIStoryboard(name: Constant.profileStroyBoard, bundle: nil).instantiateViewController(withIdentifier: Constant.profileIdentifier) as? ProfileViewController {
                    viewController.navigationController?.pushViewController(profileVC, animated: true)
                }
            }
        }, onFailure: { error in
            DispatchQueue.main.async {
                viewController.showAlert(message: error.error)
            }
        })
    }
    
    /// alamofire api call
    func signUpAlamofire(url: String,requestData: Parameters,viewController: UIViewController) {
        Helper.requestAlamofire(url: url, method: .post, parameters: requestData, responseClass: SignUpResponse.self,onSuccess: { response in
            self.signUpData?(response)
        }, onFailure: { error in
            self.errorData?(error)
        })
    }
    
    func addUser(_ name: String, _ email: String, _ password: String) {
        let user = userDb.addNewUser(name,email,password)
        userDb.saveUser(user) { result in
            self.result?(result)
        }
    }
    
    func deleteUser(email: String) {
        userDb.deleteUser(email) { result in
            self.delete?(result)
        }
    }
    
    func validateUserInput(signupModel: SignupModel) -> Bool {
            if (signupModel.name.isEmpty) {
                return false
            } else if (signupModel.email.isEmpty) {
                return false
            } else if (!isValidEmail(inputString: signupModel.email)) {
                return false
            } else if (signupModel.password.isEmpty) {
                return false
            } else if (signupModel.password.count < 8 ) {
                return false
            }
            return true
        }
        
    func isValidEmail(inputString: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: inputString)
        return result
    }
}
