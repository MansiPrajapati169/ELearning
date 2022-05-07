//
//  SceneDelegateExtension.swift
//  ELearning
//
//  Created by Mansi Prajapati on 02/06/22.
//

import UIKit

//MARK: - SceneDelegate
extension SceneDelegate {
    
    ///change root viewController
     func changeRootVC (storyBoard: String,identifier: String) {
         let storyboard = UIStoryboard(name: storyBoard, bundle: nil)
         let viewController = storyboard.instantiateViewController(withIdentifier: identifier)
         self.window?.rootViewController = UINavigationController(rootViewController: viewController)
         self.window?.makeKeyAndVisible()
     }
}
