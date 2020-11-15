//
//  sequenceAccess.swift
//  Polycon EasyLife
//
//  Created by Joshua Alanis on 2020-10-22.
//

import UIKit
import MessageUI
import Firebase

class sequenceAccess: UIViewController,UITableViewDelegate,UITableViewDataSource, MFMessageComposeViewControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let db = Firestore.firestore()
    
    var parts = [fetchParts]()
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "SEQUENCE"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getPartInfo()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parts.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0;//Choose your custom row height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "partCell") as! sequenceTableViewCell
        
        let partTitle = parts[indexPath.row]
        
        cell.partName.text = partTitle.partName
        cell.partColour.text = partTitle.partColour

        return cell
        
    }

    @IBAction func logoutClicked(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "checkLoggedIn")
        UserDefaults.standard.synchronize()
        
        self.transitionToLogin()
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func transitionToLogin() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "loginMagna") as! loginMagna
        
        view.window?.rootViewController = newViewController
        view.window?.makeKeyAndVisible()
    }
    
    @IBAction func contactLead(_ sender: Any) {
        
        let alert = UIAlertController(title: "What Happened?", message: "Need To Contact Thai?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Contact Line Leader", style: .default, handler: contactLineLeader))
        alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func refreshClicked(_ sender: Any) {
        self.tableView.reloadData()
    }
    
    @IBAction func addPartsClicked(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let addParts = storyBoard.instantiateViewController(withIdentifier: "addParts") as! addParts

        self.navigationController?.pushViewController(addParts, animated: true)
    }
    
    @IBAction func emptyClicked(_ sender: Any) {
        let alert = UIAlertController(title: "Empty Lane!", message: "The Unloader has been Notified.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Thanks!", style: .default, handler: nil))
        
        partStatusUpdate(partName: "LA REAR-VAE", laneStatus: "EMPTY")
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func almostFullClicked(_ sender: Any) {
        let alert = UIAlertController(title: "Almost Full!", message: "The Unloader has been Notified.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Thanks!", style: .default, handler: nil))
        
        partStatusUpdate(partName: "LA REAR-VAE", laneStatus: "ALMOST FULL")
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func fullClicked(_ sender: Any) {
        let alert = UIAlertController(title: "FULL LANE!", message: "The Unloader has been Notified.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Thanks!", style: .default, handler: nil))
        
        partStatusUpdate(partName: "LA REAR-VAE", laneStatus: "FULL")
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func getPartInfo() {
        
        db.collection("parts").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for part in querySnapshot!.documents {
                    
                    let partsInfo = fetchParts()
                    
                    let dictionary = part.data() as [String : Any]
                    
                    partsInfo.partName = dictionary["partName"] as? String
                    partsInfo.partColour = dictionary["partColour"] as? String
                    
                    self.parts.append(partsInfo)
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
    
    func contactLineLeader(alert: UIAlertAction!) {
        if (MFMessageComposeViewController.canSendText()) {
                    let controller = MFMessageComposeViewController()
                    controller.body = "I Need Help in Sequence"
                    controller.recipients = ["2269797607"]
                    controller.messageComposeDelegate = self
                    self.present(controller, animated: true, completion: nil)
                }
    }
    
    func partStatusUpdate(partName: String, laneStatus: String) {
        let refData = db.collection("parts").document(partName)

        refData.updateData([
            "laneStatus": laneStatus
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
    }
    
}
