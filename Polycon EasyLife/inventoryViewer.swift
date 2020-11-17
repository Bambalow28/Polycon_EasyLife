//
//  inventoryViewer.swift
//  Polycon EasyLife
//
//  Created by Joshua Alanis on 2020-10-24.
//

import UIKit
import Firebase

class inventoryViewer: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var parts = ["LD SRT"]

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "INVENTORY"
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parts.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0;//Choose your custom row height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "partCell") as! inventoryCell
        
        let partTitle = parts[indexPath.row]
        cell.partName.text = partTitle
        cell.partColour.text = "DX8"
        cell.partCount.text = "25"
        cell.partLocation.text = "BULK2"
        
        return cell
    }
    @IBAction func addInvClicked(_ sender: Any) {
        self.transitionToAddInv()
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
    
    @IBAction func searchBtnClicked(_ sender: Any) {
        searchBtnShow()
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
    
    func transitionToAddInv() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let addInvController = storyBoard.instantiateViewController(withIdentifier: "invAddPart") as! invAddPart
        
        self.navigationController?.pushViewController(addInvController, animated: true)
    }
    
    func searchBtnShow() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let searchView = storyBoard.instantiateViewController(withIdentifier: "invSearch") as! invSearch
        
        let navController = UINavigationController(rootViewController: searchView)
        
        navController.modalPresentationStyle = .overCurrentContext
        navController.modalTransitionStyle = .crossDissolve
        
        self.present(navController, animated: true, completion: nil)
    }
    
}
