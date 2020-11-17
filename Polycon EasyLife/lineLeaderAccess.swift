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

        title = "HOME"
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
