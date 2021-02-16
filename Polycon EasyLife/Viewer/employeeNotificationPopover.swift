//
//  employeeNotificationPopover.swift
//  Polycon EasyLife
//
//  Created by Joshua Alanis on 2020-12-06.
//

import UIKit

class employeeNotificationPopover: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var notificationView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var notif = ["URGENT"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notif.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0;//Choose your custom row height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "empCell") as! employeeNotificationCell
        
        let newsTitle = notif[indexPath.row]
        cell.notificationTitle.text = newsTitle
        cell.notificationDescription.text = "Did you do your Daily Screener?"
        cell.timePosted.text = "8:00AM"
        
        return cell
    }

}
