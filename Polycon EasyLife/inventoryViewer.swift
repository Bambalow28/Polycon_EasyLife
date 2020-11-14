//
//  inventoryViewer.swift
//  Polycon EasyLife
//
//  Created by Joshua Alanis on 2020-10-24.
//

import UIKit
import Firebase

class inventoryViewer: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var parts = ["LD SRT"]

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "INVENTORY"
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parts.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0;//Choose your custom row height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "partCell") as! inventoryCell
        
        let partTitle = parts[indexPath.row]
        cell.partName.text = partTitle
        cell.partColour.text = "DX8"
        cell.partCount.text = "25"
        cell.partLocation.text = "BULK2"
        
        return cell
    }
    @IBAction func addInvClicked(_ sender: Any) {
        self.transitionToAddInv()
    }
    
    @IBAction func backClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func transitionToAddInv() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let addInvController = storyBoard.instantiateViewController(withIdentifier: "invAddPart") as! invAddPart
        
        self.navigationController?.pushViewController(addInvController, animated: true)
    }
    
}
