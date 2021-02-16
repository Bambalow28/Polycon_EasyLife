//
//  employeeCell.swift
//  Polycon EasyLife
//
//  Created by Joshua Alanis on 2020-10-26.
//

import UIKit

class employeeCell: UITableViewCell {

    @IBOutlet weak var employeeCellView: UIView!
    @IBOutlet weak var employeeImage: UIImageView!
    @IBOutlet weak var employeeName: UILabel!
    @IBOutlet weak var employeeNum: UILabel!
    @IBOutlet weak var workStatus: UILabel!
    @IBOutlet weak var screenerResult: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
