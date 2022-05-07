//
//  SignInViewModel.swift
//  ELearning
//
//  Created by Mansi Prajapati on 26/05/22.
//

import UIKit
class SignInViewModel {
    
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
                Helper.showAlert(message: error.error , viewController: viewController)
            }
        })
    }
}
