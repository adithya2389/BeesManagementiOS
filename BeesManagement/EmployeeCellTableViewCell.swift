//
//  EmployeeCellTableViewCell.swift
//  BeesManagement
//
//  Created by Tammavarapu, Adithya Kalyan on 12/7/16.
//  Copyright © 2016 HoneyWell. All rights reserved.
//

import UIKit

class EmployeeCellTableViewCell: UITableViewCell {

    @IBOutlet var firstName: UILabel!

    @IBOutlet var role: UILabel!
    @IBOutlet var project: UILabel!
    @IBOutlet var lastName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(data: Employee) {
        self.firstName.text = data.firstName
        self.lastName.text = data.firstName
        self.project.text = data.projectID
        self.role.text = data.role

    }

}
