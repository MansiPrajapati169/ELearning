//
//  UserTableViewCell.swift
//  ELearning
//
//  Created by Mansi Prajapati on 20/06/22.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var lblEmail: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
