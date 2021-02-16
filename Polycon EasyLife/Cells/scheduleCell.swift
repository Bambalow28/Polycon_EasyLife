//
//  scheduleCell.swift
//  Polycon EasyLife
//
//  Created by Joshua Alanis on 2020-11-14.
//

import UIKit

class scheduleCell: UITableViewCell {

    @IBOutlet weak var roundNum: UILabel!
    @IBOutlet weak var carrierNum: UILabel!
    @IBOutlet weak var partName: UILabel!
    @IBOutlet weak var partNum: UILabel!
    @IBOutlet weak var paintColour: UILabel!
    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var loadQty: UILabel!
    @IBOutlet weak var reworkQty: UILabel!
    @IBOutlet weak var comments: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
