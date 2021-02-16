//
//  employeeDocumentsViewer.swift
//  Polycon EasyLife
//
//  Created by Joshua Alanis on 2020-12-05.
//

import UIKit

class employeeDocumentsViewer: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Documents"
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
}
