//
//  dailyScreenerResult.swift
//  Polycon EasyLife
//
//  Created by Joshua Alanis on 2020-12-05.
//

import UIKit
import Firebase

class dailyScreenerResult: UIViewController {
    
    @IBOutlet weak var screenerResultView: UIView!
    @IBOutlet weak var resultTitle: UILabel!
    @IBOutlet weak var messageBody: UILabel!
    @IBOutlet weak var responseBtn: UIButton!
    @IBOutlet weak var submitted: UILabel!
    @IBOutlet weak var dateSubmitted: UILabel!
    
    let db = Firestore.firestore()
    
    var resultNum = 0
    var empID = ""
    var teamLead = ""
    var empLocation = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: true)

        screenerResultView.layer.cornerRadius = 10
        resultTitle.layer.cornerRadius = 10
        responseBtn.layer.cornerRadius = 10
        
        resultTitle.layer.masksToBounds = true
        
        screenerResultView.layer.masksToBounds = false
        screenerResultView.layer.cornerRadius = 10
        screenerResultView.layer.shadowColor = UIColor.lightGray.cgColor
        screenerResultView.layer.shadowOpacity = 0.5
        screenerResultView.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
        screenerResultView.layer.shadowRadius = 8
        
        responseBtn.layer.cornerRadius = 10
        responseBtn.layer.shadowOffset  = CGSize(width: 0.0, height: 6.0)
        responseBtn.layer.shadowRadius  = 8
        responseBtn.layer.shadowOpacity = 0.2
        responseBtn.clipsToBounds       = true
        responseBtn.layer.masksToBounds = false

        pulsate()
        getEmployeeInfo()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.getScreenerResult()
            self.showDate()
            self.saveEmployeeResult()
            }
    }
    
    @IBAction func returnHomeClicked(_ sender: Any) {
        transitionToEmployee()
    }
    
    func transitionToEmployee() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let employeeAccessController = storyBoard.instantiateViewController(withIdentifier: "employeeAccess") as! employeeAccess

        let navController = UINavigationController(rootViewController: employeeAccessController)
        
        navController.modalPresentationStyle = .fullScreen
        navController.modalTransitionStyle = .crossDissolve
        
        self.present(navController, animated: true, completion: nil)
    }
    
    func getScreenerResult() {
        print("Result Number: \(resultNum)")
        
        if (resultNum >= 3) {
            self.resultTitle.backgroundColor = UIColor.systemRed
            self.resultTitle.text = "FAIL"
            self.messageBody.text = "Stay Home and Isolate!"
        }
        else if (resultNum < 3 && resultNum != 0) {
            self.resultTitle.backgroundColor = UIColor.systemOrange
            self.resultTitle.text = "CAREFUL"
            self.messageBody.text = "Be Careful! You Might Be Exposed!"
        }
        else if (resultNum == 0) {
            self.resultTitle.backgroundColor = UIColor.systemGreen
            self.resultTitle.text = "PASSED"
            self.messageBody.text = "Your Good to Enter the Facility!"
        }
        else {
            print("Error")
        }
    }
    
    func pulsate() {
            
            let pulse = CASpringAnimation(keyPath: "transform.scale")
            pulse.duration = 0.5
            pulse.fromValue = 0.95
            pulse.toValue = 1.0
            pulse.autoreverses = true
            pulse.repeatCount = 2
            pulse.initialVelocity = 0.5
            pulse.damping = 1.0
            
        resultTitle.layer.add(pulse, forKey: "pulse")
        }
    
    func showDate() {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "h:mm a',' MMMM dd, yyyy"
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"

        let dateString = formatter.string(from: Date())
        self.dateSubmitted.text = dateString
        self.dateSubmitted.isHidden = false
        self.submitted.isHidden = false
    }
    
    func saveEmployeeResult() {
        let ref = db.collection("employeeScreenerResults")
        
        ref.document("Joshua Alanis").setData([

            "Result": resultTitle.text!,
            "Date Submitted": dateSubmitted.text!,
            "Employee ID": empID,
            "Team Leader": teamLead,
            "Magna Location": empLocation

        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Success! Employee finished Screener @ \(self.dateSubmitted.text!)")
                }
            }
        }
    
    func getEmployeeInfo() {
        db.collection("employeeAccounts").whereField("Employee ID", isEqualTo: "921088107").getDocuments() { (querySnapshot, err) in
            
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for part in querySnapshot!.documents {
                    
                    let employeeID = part.documentID
                    
                    let dictionary = part.data() as [String : Any]
                    
                    let employeeId = employeeID
                    let teamLeader = dictionary["Team Leader"] as? String
                    let employeeLocation = dictionary["Magna Department Location"] as? String
                    
                    if let teamLeadName = teamLeader {
                        if let empLocate = employeeLocation {
                            self.empID.append(employeeId)
                            self.teamLead.append(teamLeadName)
                            self.empLocation.append(empLocate)
                        }
                    }
                }
            }
        }
    }
}
