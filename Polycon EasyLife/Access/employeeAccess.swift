//
//  employeeAccess.swift
//  Polycon EasyLife
//
//  Created by Joshua Alanis on 2020-12-05.
//

import UIKit
import WebKit

class employeeAccess: UIViewController{
    
    @IBOutlet weak var employeeNotification: UIBarButtonItem!

    let firstLaunch = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Home"
        
        if firstLaunch.bool(forKey: "firstLaunch") == true {
            firstLaunch.set(true, forKey: "firstLaunch")
        } else {
            dailyScreener()
        }
    }
    
    @IBAction func homeClicked(_ sender: Any) {
        transitionToHome()
    }
    
    @IBAction func documentClicked(_ sender: Any) {
        transitionToDocuments()
    }
    
    @IBAction func paystubClicked(_ sender: Any) {
        transitionToPaystub()
    }
    
    @IBAction func profileClicked(_ sender: Any) {
        transitionToProfile()
    }
    
    @IBAction func notificationClicked(_ sender: Any) {
        
    }
    
    func transitionToHome() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let employeeAccessController = storyBoard.instantiateViewController(withIdentifier: "employeeAccess") as! employeeAccess

        let navController = UINavigationController(rootViewController: employeeAccessController)
        
        navController.modalPresentationStyle = .fullScreen
        navController.modalTransitionStyle = .crossDissolve
        
        self.present(navController, animated: true, completion: nil)
    }
    
    func transitionToDocuments() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let employeeDocumentsController = storyBoard.instantiateViewController(withIdentifier: "employeeDocumentsViewer") as! employeeDocumentsViewer

        let navController = UINavigationController(rootViewController: employeeDocumentsController)
        
        navController.modalPresentationStyle = .fullScreen
        navController.modalTransitionStyle = .crossDissolve
        
        self.present(navController, animated: true, completion: nil)
    }
    
    func transitionToPaystub() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let employeePaystubController = storyBoard.instantiateViewController(withIdentifier: "employeePaystubViewer") as! employeePaystubViewer

        let navController = UINavigationController(rootViewController: employeePaystubController)
        
        navController.modalPresentationStyle = .fullScreen
        navController.modalTransitionStyle = .crossDissolve
        
        self.present(navController, animated: true, completion: nil)
    }
    
    func transitionToProfile() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let employeeProfileController = storyBoard.instantiateViewController(withIdentifier: "employeeProfileViewer") as! employeeProfileViewer

        let navController = UINavigationController(rootViewController: employeeProfileController)
        
        navController.modalPresentationStyle = .fullScreen
        navController.modalTransitionStyle = .crossDissolve
        
        self.present(navController, animated: true, completion: nil)
    }
    
    func transitionToDailyScreener() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let dailyScreenerController = storyBoard.instantiateViewController(withIdentifier: "dailyScreenerViewer") as! dailyScreenerViewer

        let navController = UINavigationController(rootViewController: dailyScreenerController)
        
        navController.modalPresentationStyle = .fullScreen
        navController.modalTransitionStyle = .crossDissolve
        
        self.present(navController, animated: true, completion: nil)
    }
    
    func dailyScreener() {
        let alert = UIAlertController(title: "ATTENTION", message: "Did you do your Daily Screener?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "YES", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "NO", style: .default, handler: { action in
            self.transitionToDailyScreener()
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func transitionToLogin() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "loginMagna") as! loginMagna
        
        view.window?.rootViewController = newViewController
        view.window?.makeKeyAndVisible()
    }
}
