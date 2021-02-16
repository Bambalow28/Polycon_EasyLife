//
//  changePassword.swift
//  Polycon EasyLife
//
//  Created by Joshua Alanis on 2020-12-12.
//

import UIKit
import Firebase

class changePassword: UIViewController {

    @IBOutlet weak var changePasswordView: UIView!
    @IBOutlet weak var updatePasswordBtn: UIButton!
    @IBOutlet weak var newPassword: UITextField!
    @IBOutlet weak var retypeNewPassword: UITextField!
    @IBOutlet weak var passwordChecker: UILabel!
    
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.changePasswordView.layer.cornerRadius = 10
        self.updatePasswordBtn.layer.cornerRadius = 20
        
        changePasswordView.layer.masksToBounds = false
        changePasswordView.layer.cornerRadius = 10
        changePasswordView.layer.shadowColor = UIColor.lightGray.cgColor
        changePasswordView.layer.shadowOpacity = 0.5
        changePasswordView.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
        changePasswordView.layer.shadowRadius = 8
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapped))
            tap.numberOfTapsRequired = 1
            view.addGestureRecognizer(tap)
    }
    
    @objc func tapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func updatePasswordClicked(_ sender: Any) {
        self.updatePasswordBtn.setTitle("Loading..", for: .normal)
        
        let sec = 1.0
        DispatchQueue.main.asyncAfter(deadline: .now() + sec) {
            self.validatePasswordMatch()
        }
    }
    
    func validatePasswordMatch() {
        let newPass = newPassword.text!
        let validPass = retypeNewPassword.text!
        
        if (newPass == validPass && newPass != "") {
            let ref = db.collection("employeeAccounts").document("921088107")

            ref.updateData([
                "Password": newPass
            ])
            
            self.updatePasswordBtn.layer.backgroundColor = UIColor.systemGreen.cgColor
            self.updatePasswordBtn.setTitle("Password Changed", for: .normal)
            
            let sec = 1.0
            DispatchQueue.main.asyncAfter(deadline: .now() + sec) {
                self.dismiss(animated: true, completion: nil)
            }
        }
        else if (newPass != validPass) {
            self.passwordChecker.isHidden = false
            self.passwordChecker.textColor = UIColor.systemRed
            self.passwordChecker.text = "Doesn't Match"
            
            let sec = 1.0
            DispatchQueue.main.asyncAfter(deadline: .now() + sec) {
                self.updatePasswordBtn.layer.backgroundColor = UIColor.init(red: 33.0/255.0, green: 33.0/255.0, blue: 33.0/255.0, alpha: 0.75).cgColor
                self.updatePasswordBtn.setTitle("Update Password", for: .normal)
            }
        }
        else if newPass == "" && validPass == "" {
            self.passwordChecker.isHidden = false
            self.passwordChecker.textColor = UIColor.systemRed
            self.passwordChecker.text = "Can't Be Empty"
            
            let sec = 1.0
            DispatchQueue.main.asyncAfter(deadline: .now() + sec) {
                self.updatePasswordBtn.layer.backgroundColor = UIColor.init(red: 33.0/255.0, green: 33.0/255.0, blue: 33.0/255.0, alpha: 0.75).cgColor
                self.updatePasswordBtn.setTitle("Update Password", for: .normal)
            }
        }
    }
}
