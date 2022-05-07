//
//  SignInViewController.swift
//  ELearning
//
//  Created by Mansi Prajapati on 03/05/22.
//

import UIKit

class AuthenticationViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var cvSignIn: UIView!
    @IBOutlet weak var cvSignUp: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    //MARK: - ViewController LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK: - IBActions
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        let selection = sender.selectedSegmentIndex
        if sender.isSelected {
            sender.layer.cornerRadius = 30
        }
        switch selection {
        case 0:
            self.cvSignUp.isHidden = true
            self.cvSignIn.isHidden = false
        case 1:
            self.cvSignUp.isHidden = false
            self.cvSignIn.isHidden = true
        default: break
        }
    }
}
