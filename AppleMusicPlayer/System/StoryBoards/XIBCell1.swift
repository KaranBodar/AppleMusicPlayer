//
//  XIBCell1.swift
//  AppleMusicPlayer
//
//  Created by Karan Bodar on 14/04/25.
//

import UIKit

class XIBCell1: UITableViewCell {
    @IBOutlet weak var txtLabel: UILabel!
    @IBOutlet weak var txtDetailsLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
