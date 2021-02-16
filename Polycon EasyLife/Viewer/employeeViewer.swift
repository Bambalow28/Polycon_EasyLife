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
    
    let db = Firestore.firestore()
    
    var employeeNum = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "EMPLOYEES"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getEmployeeInfo()
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
        
        cell.employeeCellView.frame = cell.frame.offsetBy(dx: 30, dy: 10);
        
        
        db.collection("employeeScreenerResults").whereField("Team Leader", isEqualTo: "Thai Phan")
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        let result = document.get("Result") as! String
                        
                        switch result {
                        case "CAREFUL":
                            cell.screenerResult.backgroundColor = UIColor.systemOrange
                        case "PASSED":
                            cell.screenerResult.backgroundColor = UIColor.systemGreen
                        case "FAIL":
                            cell.screenerResult.backgroundColor = UIColor.systemRed
                        default:
                            print("Error")
                        }
                        cell.screenerResult.text! = result
                    }
                }
            }
        
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
    
    func getEmployeeInfo() {
        db.collection("employeeAccounts").whereField("Team Leader", isEqualTo: "Thai Phan").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for employee in querySnapshot!.documents {
                    
                    let dictionary = employee.data() as [String : Any]
                    
                    let empName = dictionary["Full Name"] as? String
                    let empID = employee.documentID
                    let empLead = dictionary["Team Leader"] as? String
                    
                    if let employeeName = empName {
                        if let employeeLead = empLead {
                            self.employeeNum.append(empID)
                        }
                    }

                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
}
