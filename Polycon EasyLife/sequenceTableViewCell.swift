//
//  sequenceTableViewCell.swift
//  Polycon EasyLife
//
//  Created by Joshua Alanis on 2020-10-22.
//

import UIKit

class sequenceTableViewCell: UITableViewCell {

    @IBOutlet weak var partCellView: UIView!
    @IBOutlet weak var partName: UILabel!
    @IBOutlet weak var partColour: UILabel!
    @IBOutlet weak var partImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
