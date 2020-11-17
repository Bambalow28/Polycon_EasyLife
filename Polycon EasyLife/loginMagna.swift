//
//  loginMagna.swift
//  Polycon EasyLife
//
//  Created by Joshua Alanis on 2020-10-22.
//

import UIKit

class loginMagna: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        loginBtn.layer.cornerRadius = 10
        loginBtn.layer.shadowOffset  = CGSize(width: 0.0, height: 6.0)
        loginBtn.layer.shadowRadius  = 8
        loginBtn.layer.shadowOpacity = 0.2
        loginBtn.clipsToBounds       = true
        loginBtn.layer.masksToBounds = false
        
        username.layer.borderWidth = 1.0
        username.layer.borderColor = UIColor.black.cgColor
        username.layer.cornerRadius = 10
        
        password.layer.borderWidth = 1.0
        password.layer.borderColor = UIColor.black.cgColor
        password.layer.cornerRadius = 10
        
        username.attributedPlaceholder = NSAttributedString(string: "Username",attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        
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
            
            loginBtn.layer.backgroundColor = UIColor.systemRed.cgColor
            loginBtn.setTitle("Login Error!", for: .normal)
            
            let sec = 1.0
            DispatchQueue.main.asyncAfter(deadline: .now() + sec) {
                self.loginBtn.layer.backgroundColor = UIColor.systemBlue.cgColor
                self.loginBtn.setTitle("Login", for: .normal)
            }
        }
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
}
