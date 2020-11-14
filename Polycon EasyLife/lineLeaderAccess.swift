//
//  lineLeaderAccess.swift
//  Polycon EasyLife
//
//  Created by Joshua Alanis on 2020-10-24.
//

import UIKit

class lineLeaderAccess: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "LINE LEADER"
    }
    @IBAction func logoutClicked(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "checkLoggedIn")
        UserDefaults.standard.synchronize()
        
        self.transitionToLogin()
    }
    
    func transitionToLogin() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "loginMagna") as! loginMagna
        
        view.window?.rootViewController = newViewController
        view.window?.makeKeyAndVisible()
    }
    
    @IBAction func scheduleClicked(_ sender: Any) {
        self.transitionToSchedule()
    }
    
    @IBAction func inventoryClicked(_ sender: Any) {
        self.transitionToInventory()
    }
    
    @IBAction func employeesClicked(_ sender: Any) {
        self.transitionToEmployee()
    }
    
    func transitionToSchedule() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let scheduleView = storyBoard.instantiateViewController(withIdentifier: "scheduleViewer") as! scheduleViewer
        
        self.navigationController?.pushViewController(scheduleView, animated: true)
    }
    
    func transitionToInventory() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let inventoryView = storyBoard.instantiateViewController(withIdentifier: "inventoryViewer") as! inventoryViewer
        
        self.navigationController?.pushViewController(inventoryView, animated: true)
    }
    
    func transitionToEmployee() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let employeeView = storyBoard.instantiateViewController(withIdentifier: "employeeViewer") as! employeeViewer
        
        self.navigationController?.pushViewController(employeeView, animated: true)
    }
    
}
