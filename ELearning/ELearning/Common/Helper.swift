//
//  Helper.swift
//  ELearning
//
//  Created by Mansi Prajapati on 04/05/22.
//

import Foundation
import UIKit
import Alamofire

class Helper : UIViewController {
    
    ///for dismissing keyboard
    static func dismissKeyboard (_ view: UIView) {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    ///api calling urlsession
    static func request<T: Codable> (url: String,method: String,requestData: Data,responseClass: T.Type, responseCode: Int, onSuccess:@escaping (T) -> (), onFailure: @escaping (ErrorResponse) -> ()) {
        
        guard let url = URL(string: url) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.setValue(Constant.applicationJson, forHTTPHeaderField: Constant.contentType)
        request.httpBody = requestData
        URLSession.shared.dataTask(with: request) {
            (data, response, error) in
            
            guard let responseData = data else{
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == responseCode {
                    guard let responseData = try? JSONDecoder().decode(T.self, from: responseData) else {return}
                    onSuccess(responseData)
                }
                else {
                    guard let errors = try? JSONDecoder().decode(ErrorResponse.self, from: responseData) else {return}
                    onFailure(errors)
                }
            }
        }.resume()
    }
    
    /// alamofireb generic function
   static func requestAlamofire<T: Codable>(url: String, method: HTTPMethod, parameters: Parameters, responseClass: T.Type, onSuccess:@escaping (T) -> (), onFailure: @escaping (ErrorResponse) -> ()) {
        AF.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: [:]).response {
            response in
            guard let data = response.data else {
                return
            }
            do {
                let result = try JSONDecoder().decode(responseClass.self, from: data)
                onSuccess(result)
            } catch {
                guard let errors = try? JSONDecoder().decode(ErrorResponse.self, from: data) else {return}
                onFailure(errors)
            }
            
        }
    }
}

extension UIViewController {
    
    ///for showing alert
        func showAlert(message: String) {
        let alertController = UIAlertController(title: NSLocalizedString("Alert!", comment: ""), message: message, preferredStyle: .alert)
         alertController.addAction(UIAlertAction(title: NSLocalizedString("Dismiss", comment: ""), style: .default))
         self.present(alertController, animated: true, completion: nil)
     }
}

extension UIViewController {
    
    ///Email validation
    func validEmail (email: String?) -> Bool {
        
        let regularExpressionForEmail = Constant.emailPattern
        let testEmail = NSPredicate(format: Constant.emailFormat, regularExpressionForEmail)
        var isEmailValid = false
        
        switch true {
        case email?.isEmpty:
            self.showAlert(message: R.string.localizable.requiredEmail())
        case testEmail.evaluate(with: email):
            isEmailValid = true
            break
        default:
            self.showAlert(message: R.string.localizable.invalidEmail())
        }
        return isEmailValid
    }
    
    ///Empty validation
   func checkEmpty(str: String?,message: String) -> Bool {
       var notEmpty = false
       
       switch true {
       case str?.isEmpty:
           showAlert(message: message)
       default:
           notEmpty = true
           break
       }
       return notEmpty
    }
    
    ///Password validation
    func passwordShort(str: String?) -> Bool {
        var notShort = false
        
        switch true {
        case str?.count ?? .zero < 8:
            self.showAlert(message: R.string.localizable.shortPassword())
        default:
            notShort = true
            break
        }
        return notShort
    }
}
