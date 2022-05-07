//
//  SignInViewModel.swift
//  ELearning
//
//  Created by Mansi Prajapati on 25/05/22.
//

import UIKit

class SignUpViewModel {
    
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
                Helper.showAlert(message: error.error , viewController: viewController)
            }
        })
    }
}
