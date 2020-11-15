//
//  scheduleViewer.swift
//  Polycon EasyLife
//
//  Created by Joshua Alanis on 2020-10-24.
//

import UIKit

class scheduleViewer: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblDate: UILabel!
    
    var scheduleNumber = ["1"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "SCHEDULE VIEWER"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "LLLL dd, yyyy"
        let formattedDate = format.string(from: date)
        
        lblDate.text = formattedDate
        lblDate.layer.cornerRadius = 10
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scheduleNumber.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 182.0;//Choose your custom row height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scheduleCell") as! scheduleCell
        
        let roundNum = scheduleNumber[indexPath.row]
        
        cell.roundNum.text = roundNum
        cell.roundNum.backgroundColor = UIColor.white
        cell.partName.text = "LA REAR"
        cell.partNum.text = "9360000"
        cell.paintColour.text = "VAE"
        cell.quantity.text = "60"
        cell.loadQty.text = "40"
        cell.reworkQty.text = "10"
        
        cell.comments.text = "Missing 10 Parts"
        cell.comments.backgroundColor = UIColor.systemRed
        
        return cell
    }

    @IBAction func backClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
