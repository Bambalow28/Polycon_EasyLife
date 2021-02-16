//
//  createAccountAccess.swift
//  Polycon EasyLife
//
//  Created by Joshua Alanis on 2020-12-08.
//

import UIKit
import DropDown
import Firebase

class createAccountAccess: UIViewController {
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var emailAddress: UITextField!
    @IBOutlet weak var phoneNum: UITextField!
    @IBOutlet weak var country: UITextField!
    @IBOutlet weak var province: UITextField!
    @IBOutlet weak var employeeID: UITextField!
    @IBOutlet weak var teamLeader: UITextField!
    @IBOutlet weak var lineLeader: UITextField!
    @IBOutlet weak var magnaDepartmentDropdown: UIButton!
    
    let db = Firestore.firestore()
    let magnaDepartment = DropDown()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Create Account"
        
        DropDown.appearance().cornerRadius = 10
        magnaDepartmentDropdown.layer.cornerRadius = 10
        magnaDepartment.dismissMode = .automatic
    }
    
    @IBAction func magnaDepartmentClicked(_ sender: UIButton) {
        magnaDepartment.dataSource = ["Polycon Industries [Magna Exteriors]"]//4
        magnaDepartment.anchorView = sender as AnchorView //5
        magnaDepartment.bottomOffset = CGPoint(x: 0, y: (sender as AnyObject).frame.size.height) //6
        magnaDepartment.show() //7
        magnaDepartment.selectionAction = { [weak self] (index: Int, item: String) in //8
              guard let _ = self else { return }
                (sender as AnyObject).setTitle(item, for: .normal) //9
            }
    }
    
    @IBAction func createClicked(_ sender: Any) {
        let getMagnaDepartment = magnaDepartmentDropdown.currentTitle!
        let passwordSet = temporaryPassword(length: 7)
        
        let ref = db.collection("employeeAccounts")
        
        ref.document(employeeID.text!).setData([
            "Employee ID": employeeID.text!,
            "Full Name": firstName.text! + " " + lastName.text!,
            "Email": emailAddress.text!,
            "phoneNumber": phoneNum.text!,
            "Country": country.text!,
            "Province": province.text!,
            "Magna Department Location": getMagnaDepartment,
            "Team Leader": teamLeader.text!,
            "Line Leader": lineLeader.text!,
            "Password": passwordSet
            
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                self.createdAlert()
            }
        }
    }
    
    @IBAction func returnClicked(_ sender: Any) {
        self.transitionToLogin()
    }
    
    func transitionToLogin() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "loginMagna") as! loginMagna
        
        view.window?.rootViewController = newViewController
        view.window?.makeKeyAndVisible()
    }
    
    func transitionToEmployee() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let employeeAccessController = storyBoard.instantiateViewController(withIdentifier: "employeeAccess") as! employeeAccess

        let navController = UINavigationController(rootViewController: employeeAccessController)
        
        navController.modalPresentationStyle = .fullScreen
        navController.modalTransitionStyle = .crossDissolve
        
        self.present(navController, animated: true, completion: nil)
    }
    
    func createdAlert() {
        let alert = UIAlertController(title: "Success!", message: "You should get an email in the next 2-3 min with all your login Information.", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Okay, Thanks", style: .default, handler:  {_ in
            self.transitionToEmployee()
        }))

        self.present(alert, animated: true)
    }
    
    func temporaryPassword(length: Int) -> String {
      let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
      return String((0..<length).map{ _ in letters.randomElement()! })
    }
}
