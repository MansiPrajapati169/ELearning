//
//  UsersListViewController.swift
//  ELearning
//
//  Created by Mansi Prajapati on 20/06/22.
//

import UIKit
import RealmSwift

class UsersListViewController: UIViewController{
    
    var data: Results<UserRegister>?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
}

extension UsersListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.userListCell.identifier) as? UserTableViewCell else {return UITableViewCell()}
        if(data?.count ?? 0 > .zero) {
            cell.lblEmail.text = data?[indexPath.row].email
        }
        return cell
    }
}
