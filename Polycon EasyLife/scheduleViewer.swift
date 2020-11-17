//
//  scheduleViewer.swift
//  Polycon EasyLife
//
//  Created by Joshua Alanis on 2020-10-24.
//

import UIKit

class scheduleViewer: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblDate: UILabel!
    
    var scheduleNumber = ["1"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "SCHEDULE VIEWER"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "LLLL dd, yyyy"
        let formattedDate = format.string(from: date)
        
        lblDate.text = formattedDate
        lblDate.layer.cornerRadius = 10
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scheduleNumber.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 182.0;//Choose your custom row height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scheduleCell") as! scheduleCell
        
        let roundNum = scheduleNumber[indexPath.row]
        
        cell.roundNum.text = roundNum
        cell.roundNum.backgroundColor = UIColor.white
        cell.partName.text = "LA REAR"
        cell.partNum.text = "9360000"
        cell.paintColour.text = "VAE"
        cell.quantity.text = "60"
        cell.loadQty.text = "40"
        cell.reworkQty.text = "10"
        
        cell.comments.text = "Missing 10 Parts"
        cell.comments.backgroundColor = UIColor.systemRed
        
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
}
