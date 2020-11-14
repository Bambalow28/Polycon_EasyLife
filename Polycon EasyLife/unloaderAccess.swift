//
//  unloaderAccess.swift
//  Polycon EasyLife
//
//  Created by Joshua Alanis on 2020-10-22.
//

import UIKit
import Firebase

class unloaderAccess: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let db = Firestore.firestore()
    
    var parts = [fetchParts]()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "UNLOADER"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getPartStatus()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parts.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0;//Choose your custom row height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "partCell") as! unloaderTableViewCell
        
        let partTitle = parts[indexPath.row]
        
        cell.partName.text = partTitle.partName
        cell.partColour.text = partTitle.partColour
        cell.partStatus.text = partTitle.laneStatus
        
        if (cell.partStatus.text! == "EMPTY") {
            cell.partStatus.backgroundColor = UIColor.systemGreen
        }
        else if (cell.partStatus.text! == "ALMOST") {
            cell.partStatus.backgroundColor = UIColor.systemYellow
        }
        else if (cell.partStatus.text! == "FULL") {
            cell.partStatus.backgroundColor = UIColor.systemRed
        }
        else {
            print("Oops! Something Went Wrong!")
        }
        
        return cell
    }
    @IBAction func reloadClicked(_ sender: Any) {
        self.tableView.reloadData()
    }
    
    @IBAction func logoutClicked(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "checkLoggedIn")
        UserDefaults.standard.synchronize()
        
        self.transitionToLogin()
    }
    
    func transitionToLogin() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "loginMagna") as! loginMagna
        
        view.window?.rootViewController = newViewController
        view.window?.makeKeyAndVisible()
    }
    
    @IBAction func contactLead(_ sender: Any) {
        let alert = UIAlertController(title: "What Happened?", message: "Need To Contact Thai?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Yes, Call Thai", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func getPartStatus() {
        db.collection("parts").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for part in querySnapshot!.documents {
                    
                    let partsInfo = fetchParts()
                    
                    let dictionary = part.data() as [String : Any]
                    
                    partsInfo.partName = dictionary["partName"] as? String
                    partsInfo.partColour = dictionary["partColour"] as? String
                    partsInfo.laneStatus = dictionary["laneStatus"] as? String
                    
                    self.parts.append(partsInfo)
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
    
}
