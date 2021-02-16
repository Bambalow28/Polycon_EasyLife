//
//  employeeNotificationCell.swift
//  Polycon EasyLife
//
//  Created by Joshua Alanis on 2020-12-06.
//

import UIKit

class employeeNotificationCell: UITableViewCell {

    @IBOutlet weak var magnaImage: UIImageView!
    @IBOutlet weak var notificationTitle: UILabel!
    @IBOutlet weak var notificationDescription: UILabel!
    @IBOutlet weak var timePosted: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
