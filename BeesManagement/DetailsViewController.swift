//
//  DetailsViewController.swift
//  BeesManagement
//
//  Created by Tammavarapu, Adithya Kalyan on 12/7/16.
//  Copyright © 2016 HoneyWell. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController,UITableViewDelegate, UITableViewDataSource{

    var role: String?
    var employees: [Employee]?
    
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.users { (data) in
            print(data)

            if let employees = data as? [[String : AnyObject]] {
                for emp in employees {
                    print(emp)
                }
            }
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EmployeeCellTableViewCell
        cell.configureCell(data: (employees?[indexPath.row])!)
        return cell
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
