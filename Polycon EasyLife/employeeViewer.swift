//
//  employeeViewer.swift
//  Polycon EasyLife
//
//  Created by Joshua Alanis on 2020-10-24.
//

import UIKit
import Firebase

class employeeViewer: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var employeeNum = ["921088107"]

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "EMPLOYEES"
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeeNum.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0;//Choose your custom row height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "employeeCell") as! employeeCell
        
        let employeeNumber = employeeNum[indexPath.row]
        
        cell.employeeName.text = "Joshua Alanis"
        cell.employeeNum.text = employeeNumber
        cell.workStatus.text = "WORKING"
        
        return cell
    }
    
    @IBAction func addEmployeeClicked(_ sender: Any) {
        transitionToAddInv()
    }
    
    @IBAction func backClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func transitionToAddInv() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let addEmployeeController = storyBoard.instantiateViewController(withIdentifier: "employeeAdd") as! employeeAdd
        
        self.navigationController?.pushViewController(addEmployeeController, animated: true)
    }
}
