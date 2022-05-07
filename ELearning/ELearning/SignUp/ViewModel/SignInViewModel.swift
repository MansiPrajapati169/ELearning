//
//  SignInViewModel.swift
//  ELearning
//
//  Created by Mansi Prajapati on 26/05/22.
//

import UIKit
import Alamofire
import RealmSwift

class SignInViewModel {
    
    //MARK: - Variables
    var signInData:( (SignInResponse) -> Void)?
    var errorData:( (ErrorResponse) -> Void)?
    var result: ((UserRegister?) -> Void)?
    var users: ((Results<UserRegister>) ->  Void)?
    
    ///api calling signIn
    func signIn(url: String,requestData: UserData,viewController: UIViewController) {
        guard let jsonData = try? JSONEncoder().encode(requestData) else {
            return
        }
        
        Helper.request(url: url, method: Constant.post,requestData: jsonData, responseClass: SignInResponse.self,responseCode: 200,onSuccess: { response in
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
    func signInAlamofire(url: String,requestData: Parameters,viewController: UIViewController) {
        Helper.requestAlamofire(url: url, method: .post, parameters: requestData, responseClass: SignInResponse.self,onSuccess: { response in
            self.signInData?(response)
        }, onFailure: { error in
            self.errorData?(error)
        })
    }
    
    func getData(_ email: String, _ password: String) {
        let data = userDb.findUser(email,password)
        result?(data.first)
    }
    
    func getAllUsers() {
        let data = userDb.getAllUsers()
        users?(data)
    }
}
