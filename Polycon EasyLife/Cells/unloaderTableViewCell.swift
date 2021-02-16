//
//  unloaderTableViewCell.swift
//  Polycon EasyLife
//
//  Created by Joshua Alanis on 2020-10-24.
//

import UIKit

class unloaderTableViewCell: UITableViewCell {

    @IBOutlet weak var partImage: UIImageView!
    @IBOutlet weak var partName: UILabel!
    @IBOutlet weak var partColour: UILabel!
    @IBOutlet weak var partStatus: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
