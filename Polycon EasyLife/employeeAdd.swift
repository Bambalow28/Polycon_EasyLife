//
//  employeeAdd.swift
//  Polycon EasyLife
//
//  Created by Joshua Alanis on 2020-10-27.
//

import UIKit
import Firebase

class employeeAdd: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var employeeName: UITextField!
    @IBOutlet weak var employeeNum: UITextField!
    @IBOutlet weak var teamLead: UITextField!
    @IBOutlet weak var randstadBtn: UIButton!
    @IBOutlet weak var magnaBtn: UIButton!
    @IBOutlet weak var addEmployeeBtn: UIButton!
    
    let db = Firestore.firestore()
    var employedFrom = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "ADD EMPLOYEE"
        
        randstadBtn.layer.cornerRadius = 10
        magnaBtn.layer.cornerRadius = 10
    
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DismissKeyboard))
            
            view.addGestureRecognizer(tap)
    }
    @IBAction func randstadBtnClicked(_ sender: Any) {
        employedFrom = "RANDSTAD"
        
        randstadBtn.layer.borderWidth = 2.0
        randstadBtn.layer.borderColor = UIColor.systemGreen.cgColor
    }
    
    @IBAction func magnaBtnClicked(_ sender: Any) {
        employedFrom = "MAGNA"
        
        magnaBtn.layer.borderWidth = 2.0
        magnaBtn.layer.borderColor = UIColor.systemGreen.cgColor
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

    @IBAction func addEmployeePhoto(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.allowsEditing = true
        vc.delegate = self
        present(vc, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        picker.allowsEditing = true
        picker.dismiss(animated: true)

        guard let image = info[.editedImage] as? UIImage else
        {
            print("No image found")
            return
        }

        addEmployeeBtn.setBackgroundImage(image, for: .normal)
    }
    
    @IBAction func addEmployeeClicked(_ sender: Any) {
        
        let ref = db.collection("employees")
        
        ref.document(employeeName.text!).setData([
            "employeeName": employeeName.text!,
            "employeeNumber": employeeNum.text!,
            "teamLeader": teamLead.text!,
            "employedFrom": employedFrom

        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                self.addEmployeeBtn.setTitle("Added!", for: .normal)
                self.addEmployeeBtn.backgroundColor = UIColor.systemGreen
                
                let sec = 1.0
                DispatchQueue.main.asyncAfter(deadline: .now() + sec) {
                    self.addEmployeeBtn.setTitle("ADD EMPLOYEE TO LINE", for: .normal)
                    self.addEmployeeBtn.backgroundColor = UIColor.systemIndigo
                }
            }
        }
    }
}
