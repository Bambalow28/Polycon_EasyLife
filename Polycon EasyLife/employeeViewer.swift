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
    
    @IBAction func homeClicked(_ sender: Any) {
        transitionToHome()
    }
    
    @IBAction func inventoryClicked(_ sender: Any) {
        transitionToInventory()
    }
    
    @IBAction func communicationClicked(_ sender: Any) {
    }
    
    @IBAction func scheduleClicked(_ sender: Any) {
        transitionToSchedule()
    }
    
    @IBAction func employeesClicked(_ sender: Any) {
        transitionToEmployee()
    }
    
    @IBAction func addEmployeeClicked(_ sender: Any) {
        transitionToAddEmployee()
    }
    
    func transitionToHome() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let homeController = storyBoard.instantiateViewController(withIdentifier: "lineLeaderAccess") as! lineLeaderAccess
        
        let navController = UINavigationController(rootViewController: homeController)
        
        navController.modalPresentationStyle = .fullScreen
        navController.modalTransitionStyle = .crossDissolve
        
        self.present(navController, animated: true, completion: nil)
    }
    
    func transitionToSchedule() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let scheduleView = storyBoard.instantiateViewController(withIdentifier: "scheduleViewer") as! scheduleViewer
        
        let navController = UINavigationController(rootViewController: scheduleView)
        
        navController.modalPresentationStyle = .fullScreen
        navController.modalTransitionStyle = .crossDissolve
        
        self.present(navController, animated: true, completion: nil)
    }
    
    func transitionToInventory() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let inventoryView = storyBoard.instantiateViewController(withIdentifier: "inventoryViewer") as! inventoryViewer
        
        let navController = UINavigationController(rootViewController: inventoryView)
        
        navController.modalPresentationStyle = .fullScreen
        navController.modalTransitionStyle = .crossDissolve
        
        self.present(navController, animated: true, completion: nil)
    }
    
    func transitionToEmployee() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let employeeView = storyBoard.instantiateViewController(withIdentifier: "employeeViewer") as! employeeViewer
        
        let navController = UINavigationController(rootViewController: employeeView)
        
        navController.modalPresentationStyle = .fullScreen
        navController.modalTransitionStyle = .crossDissolve
        
        self.present(navController, animated: true, completion: nil)
    }

    func transitionToAddEmployee() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let addEmployeeController = storyBoard.instantiateViewController(withIdentifier: "employeeAdd") as! employeeAdd
        
        self.navigationController?.pushViewController(addEmployeeController, animated: true)
    }
}
