//
//  invAddPart.swift
//  Polycon EasyLife
//
//  Created by Joshua Alanis on 2020-10-27.
//

import UIKit
import Foundation
import Firebase

class invAddPart: UIViewController {
    
    @IBOutlet weak var partName: UITextField!
    @IBOutlet weak var paintColour: UITextField!
    @IBOutlet weak var partCount: UITextField!
    @IBOutlet weak var storageLocation: UITextField!
    @IBOutlet weak var addBtn: UIButton!
    
    let db = Firestore.firestore()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "ADD PARTS"

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DismissKeyboard))
            
            view.addGestureRecognizer(tap)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if ((notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue) != nil {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= 90
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    
    @objc func DismissKeyboard() {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_textFeld: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @IBAction func backClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addPartClicked(_ sender: Any) {
        
        let ref = db.collection("inventoryParts")
        
        ref.document().setData([
            "partName": partName.text!,
            "paintColour": paintColour.text!,
            "countNum": partCount.text!,
            "storageLocation": storageLocation.text!

        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                self.addBtn.setTitle("Added!", for: .normal)
                self.addBtn.backgroundColor = UIColor.systemGreen
                
                let sec = 1.0
                DispatchQueue.main.asyncAfter(deadline: .now() + sec) {
                    self.addBtn.setTitle("ADD PART", for: .normal)
                    self.addBtn.backgroundColor = UIColor.systemBlue
                }
            }
        }
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
    
    @IBAction func employeeClicked(_ sender: Any) {
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
