//
//  employeeProfileViewer.swift
//  Polycon EasyLife
//
//  Created by Joshua Alanis on 2020-12-05.
//

import UIKit

class employeeProfileViewer: UIViewController {

    @IBOutlet weak var employeeId: UITextField!
    @IBOutlet weak var fullName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Profile"
        
        employeeId.layer.cornerRadius = 10
        employeeId.layer.shadowOffset  = CGSize(width: 0.0, height: 6.0)
        employeeId.layer.shadowRadius  = 8
        employeeId.layer.shadowOpacity = 0.2
        employeeId.clipsToBounds       = true
        employeeId.layer.masksToBounds = false
        
        fullName.layer.cornerRadius = 10
        fullName.layer.shadowOffset  = CGSize(width: 0.0, height: 6.0)
        fullName.layer.shadowRadius  = 8
        fullName.layer.shadowOpacity = 0.2
        fullName.clipsToBounds       = true
        fullName.layer.masksToBounds = false
        
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
    
    @IBAction func changePasswordClicked(_ sender: Any) {
        transitionToChangePassword()
    }
    
    @IBAction func logoutClicked(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "firstLaunch")
        UserDefaults.standard.synchronize()
        
        transitionToLogin()
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
    
    func transitionToLogin() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "loginMagna") as! loginMagna
        
        view.window?.rootViewController = newViewController
        view.window?.makeKeyAndVisible()
    }
    
    func transitionToChangePassword() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let changePasswordController = storyBoard.instantiateViewController(withIdentifier: "changePassword") as! changePassword

        let navController = UINavigationController(rootViewController: changePasswordController)
        
        navController.modalPresentationStyle = .overCurrentContext
        navController.modalTransitionStyle = .coverVertical
        
        self.present(navController, animated: true, completion: nil)
    }
}
