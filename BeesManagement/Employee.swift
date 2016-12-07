//
//  Employee.swift
//  BeesManagement
//
//  Created by Tammavarapu, Adithya Kalyan on 12/7/16.
//  Copyright © 2016 HoneyWell. All rights reserved.
//

import UIKit

class Employee: NSObject {

    var firstName: String
    var lastName: String
    var email: String
    var projectID: String
    var role: String
    
    init(firstName: String,lastName: String,email : String,projectID : String,role : String) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = firstName
        self.projectID = firstName
        self.role = role
        super.init()
    }
}
