//
//  loginMagna.swift
//  Polycon EasyLife
//
//  Created by Joshua Alanis on 2020-10-22.
//

import UIKit
import Firebase

class loginMagna: UIViewController {

    @IBOutlet weak var magnaLogo: UIImageView!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var createAccountBtn: UIButton!
    @IBOutlet weak var magnaLogoBackground: UIView!
    
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginBtn.layer.cornerRadius = 20
        createAccountBtn.layer.cornerRadius = 20
        magnaLogoBackground.layer.cornerRadius = 10
        
        createAccountBtn.layer.borderWidth = 1.0
        createAccountBtn.layer.borderColor = UIColor.gray.cgColor
        
        username.layer.cornerRadius = 10
        username.layer.shadowOffset  = CGSize(width: 0.0, height: 6.0)
        username.layer.shadowRadius  = 8
        username.layer.shadowOpacity = 0.2
        username.clipsToBounds       = true
        username.layer.masksToBounds = false
        
        password.layer.cornerRadius = 10
        password.layer.shadowOffset  = CGSize(width: 0.0, height: 6.0)
        password.layer.shadowRadius  = 8
        password.layer.shadowOpacity = 0.2
        password.clipsToBounds       = true
        password.layer.masksToBounds = false
        
        username.attributedPlaceholder = NSAttributedString(string: "User ID",attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        
        password.attributedPlaceholder = NSAttributedString(string: "Password",attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DismissKeyboard))
            
            view.addGestureRecognizer(tap)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if ((notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue) != nil {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= 130
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
    
    @IBAction func loginClicked(_ sender: Any) {
        self.signInEmployee()
    }
    
    @IBAction func createAccountClicked(_ sender: Any) {
        self.transitionToCreateAccount()
    }
    
    
    fileprivate func checkLoggedIn() -> Bool {
        
        return UserDefaults.standard.bool(forKey: "checkLoggedIn")
        
    }
    
    func transitionToSequence() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "sequenceAccess") as! sequenceAccess

        let navController = UINavigationController(rootViewController: newViewController)
        
        navController.modalPresentationStyle = .fullScreen
        navController.modalTransitionStyle = .crossDissolve
        
        self.present(navController, animated: true, completion: nil)
    }
    
    func transitionToUnloader() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "unloaderAccess") as! unloaderAccess

        let navController = UINavigationController(rootViewController: newViewController)
        
        navController.modalPresentationStyle = .fullScreen
        navController.modalTransitionStyle = .crossDissolve
        
        self.present(navController, animated: true, completion: nil)
    }
    
    func transitionToLineLeader() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "lineLeaderAccess") as! lineLeaderAccess

        let navController = UINavigationController(rootViewController: newViewController)
        
        navController.modalPresentationStyle = .fullScreen
        navController.modalTransitionStyle = .crossDissolve
        
        self.present(navController, animated: true, completion: nil)
    }
    
    func transitionToEmployee() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let employeeAccessController = storyBoard.instantiateViewController(withIdentifier: "employeeAccess") as! employeeAccess

        let navController = UINavigationController(rootViewController: employeeAccessController)
        
        navController.modalPresentationStyle = .fullScreen
        navController.modalTransitionStyle = .crossDissolve
        
        self.present(navController, animated: true, completion: nil)
    }
    
    func transitionToCreateAccount() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let createAccountController = storyBoard.instantiateViewController(withIdentifier: "createAccountAccess") as! createAccountAccess

        let navController = UINavigationController(rootViewController: createAccountController)
        
        navController.modalPresentationStyle = .fullScreen
        navController.modalTransitionStyle = .crossDissolve
        
        self.present(navController, animated: true, completion: nil)
    }
    
    func transitionToMagnaScreener() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let magnaScreenerController = storyBoard.instantiateViewController(withIdentifier: "magnaScreener") as! magnaScreener

        let navController = UINavigationController(rootViewController: magnaScreenerController)
        
        navController.modalPresentationStyle = .fullScreen
        navController.modalTransitionStyle = .crossDissolve
        
        self.present(navController, animated: true, completion: nil)
    }
    
    func signInEmployee() {
        if(username.text == "sequence" && password.text == "seq2020") {
            loginBtn.layer.backgroundColor = UIColor.systemGreen.cgColor

            loginBtn.setTitle("Success!", for: .normal)

            UserDefaults.standard.set(true, forKey: "checkLoggedIn")
            UserDefaults.standard.synchronize()

            let sec = 1.0
            DispatchQueue.main.asyncAfter(deadline: .now() + sec) {
                self.transitionToSequence()
            }
        }
        
        else if (username.text == "magna" && password.text == "screener") {
            loginBtn.layer.backgroundColor = UIColor.systemGreen.cgColor

            loginBtn.setTitle("Success!", for: .normal)

            UserDefaults.standard.set(true, forKey: "checkLoggedIn")
            UserDefaults.standard.synchronize()

            let sec = 1.0
            DispatchQueue.main.asyncAfter(deadline: .now() + sec) {
                self.transitionToMagnaScreener()
            }
        }

        else if(username.text == "unloader" && password.text == "unload2020") {

            loginBtn.layer.backgroundColor = UIColor.systemGreen.cgColor

            loginBtn.setTitle("Success!", for: .normal)

            UserDefaults.standard.set(true, forKey: "checkLoggedIn")
            UserDefaults.standard.synchronize()

            let sec = 1.0
            DispatchQueue.main.asyncAfter(deadline: .now() + sec) {
                self.transitionToUnloader()
            }
        }

        else if(username.text == "linelead" && password.text == "line2020") {

            loginBtn.layer.backgroundColor = UIColor.systemGreen.cgColor

            loginBtn.setTitle("Success!", for: .normal)

            UserDefaults.standard.set(true, forKey: "checkLoggedIn")
            UserDefaults.standard.synchronize()

            let sec = 1.0
            DispatchQueue.main.asyncAfter(deadline: .now() + sec) {
                self.transitionToLineLeader()
            }
        }

        else {
            db.collection("employeeAccounts").getDocuments() { (querySnapshot, err) in
                
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for part in querySnapshot!.documents {
                        
                        let employeeID = part.documentID
                        
                        let dictionary = part.data() as [String : Any]
                        
                        let loginUser = employeeID
                        let loginPassword = dictionary["Password"] as? String
                        
                        if (loginUser == self.username.text!) {
                            if (loginPassword == self.password.text!) {
                                self.loginBtn.layer.backgroundColor = UIColor.systemGreen.cgColor
                                
                                self.loginBtn.setTitle("Success", for: .normal)
                                
                                UserDefaults.standard.set(true, forKey: "checkLoggedIn")
                                UserDefaults.standard.synchronize()
                                
                                let sec = 1.0
                                DispatchQueue.main.asyncAfter(deadline: .now() + sec) {
                                    self.transitionToEmployee()
                                }
                            }
                            else {
                                self.loginBtn.layer.backgroundColor = UIColor.systemRed.cgColor
                                self.loginBtn.setTitle("Incorrect Password!", for: .normal)
                                
                                let sec = 1.0
                                DispatchQueue.main.asyncAfter(deadline: .now() + sec) {
                                    self.loginBtn.layer.backgroundColor = UIColor.systemIndigo.cgColor
                                    self.loginBtn.setTitle("Login", for: .normal)
                                }
                            }
                        }
                        else {
                            self.loginBtn.layer.backgroundColor = UIColor.systemRed.cgColor
                            self.loginBtn.setTitle("Login Error!", for: .normal)
                            
                            let sec = 1.0
                            DispatchQueue.main.asyncAfter(deadline: .now() + sec) {
                                self.loginBtn.layer.backgroundColor = UIColor.systemIndigo.cgColor
                                self.loginBtn.setTitle("LOGIN", for: .normal)
                            }
                        }
                    }
                }
//            loginBtn.layer.backgroundColor = UIColor.systemRed.cgColor
//            loginBtn.setTitle("Login Error!", for: .normal)
//
//            let sec = 1.0
//            DispatchQueue.main.asyncAfter(deadline: .now() + sec) {
//                self.loginBtn.layer.backgroundColor = UIColor.systemBlue.cgColor
//                self.loginBtn.setTitle("Login", for: .normal)
            }
        }
    }
}
