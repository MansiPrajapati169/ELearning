//
//  WorkExperienceTableViewCell.swift
//  ELearning
//
//  Created by Mansi Prajapati on 05/05/22.
//

import UIKit

class WorkExperienceTableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblYear: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
