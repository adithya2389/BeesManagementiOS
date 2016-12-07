//
//  LoginViewController.swift
//  BeesManagement
//
//  Created by Tammavarapu, Adithya Kalyan on 12/7/16.
//  Copyright © 2016 HoneyWell. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var userNameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    var role: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.passwordField.isSecureTextEntry = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        
        let username = userNameField.text
        let password = passwordField.text
        NetworkManager.login(username: username!, password: password!,completion: { data in
                if let response = data as? [String: Any]{
                    self.role = response["role"] as! String
                    if (self.role != nil) {
                        self.performSegue(withIdentifier: "showDetails", sender: nil)
                    }
                else {
                    self.showLoginFailed(message: "Please check your username or password and try gaian!")
                }
            }
        })
    }

    func showLoginFailed(message: String) {
            let alert = UIAlertController.init(title: "BeesManagement", message: message, preferredStyle: .alert)
            self.show(alert, sender: nil)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showDetails" {
            let detailsVC = segue.destination as! DetailsViewController
            detailsVC.role = self.role
        }
        
    }
    

}
