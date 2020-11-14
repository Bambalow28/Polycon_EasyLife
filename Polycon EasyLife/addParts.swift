//
//  addParts.swift
//  Polycon EasyLife
//
//  Created by Joshua Alanis on 2020-10-23.
//

import UIKit
import Firebase

class addParts: UIViewController {
    
    @IBOutlet weak var partName: UITextField!
    @IBOutlet weak var partNumber: UITextField!
    @IBOutlet weak var partColour: UITextField!
    @IBOutlet weak var addPartBtn: UIButton!
    @IBOutlet weak var fullBtn: UIButton!
    @IBOutlet weak var emptyBtn: UIButton!
    @IBOutlet weak var almostfullBtn: UIButton!
    
    var laneStatus: (String) = ""
    let db = Firestore.firestore()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "ADD NEW PART"
        
        addPartBtn.layer.cornerRadius = 10
        
        partName.layer.borderWidth = 1.0
        partName.layer.borderColor = UIColor.black.cgColor
        
        partColour.layer.borderWidth = 1.0
        partColour.layer.borderColor = UIColor.black.cgColor
        
        fullBtn.layer.borderWidth = 2.0
        emptyBtn.layer.borderWidth = 2.0
        almostfullBtn.layer.borderWidth = 2.0
        fullBtn.layer.borderColor = UIColor.clear.cgColor
        emptyBtn.layer.borderColor = UIColor.clear.cgColor
        almostfullBtn.layer.borderColor = UIColor.clear.cgColor
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DismissKeyboard))
            
            view.addGestureRecognizer(tap)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if ((notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue) != nil {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= 0
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
    

    @IBAction func addPartClicked(_ sender: Any) {
        
        let ref = db.collection("parts")
        
        ref.document(partName.text! + "-" + partColour.text!).setData([
            "partName": partName.text!,
            "partNum": partNumber.text!,
            "partColour": partColour.text!,
            "laneStatus": laneStatus

        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                self.addPartBtn.setTitle("Added!", for: .normal)
                self.addPartBtn.backgroundColor = UIColor.systemGreen
                
                let sec = 1.0
                DispatchQueue.main.asyncAfter(deadline: .now() + sec) {
                    self.addPartBtn.setTitle("ADD PART", for: .normal)
                    self.addPartBtn.backgroundColor = UIColor.systemBlue
                }
            }
        }
    }
    @IBAction func emptyClicked(_ sender: Any) {
        laneStatus = "EMPTY"
        emptyBtn.layer.borderColor = UIColor.systemBlue.cgColor
        fullBtn.layer.borderColor = UIColor.clear.cgColor
        almostfullBtn.layer.borderColor = UIColor.clear.cgColor
    }
    @IBAction func fullClicked(_ sender: Any) {
        laneStatus = "FULL"
        fullBtn.layer.borderColor = UIColor.systemBlue.cgColor
        emptyBtn.layer.borderColor = UIColor.clear.cgColor
        almostfullBtn.layer.borderColor = UIColor.clear.cgColor
    }
    @IBAction func almostFullClicked(_ sender: Any) {
        laneStatus = "ALMOST FULL"
        almostfullBtn.layer.borderColor = UIColor.systemBlue.cgColor
        fullBtn.layer.borderColor = UIColor.clear.cgColor
        emptyBtn.layer.borderColor = UIColor.clear.cgColor
    }
    
    @IBAction func backClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
