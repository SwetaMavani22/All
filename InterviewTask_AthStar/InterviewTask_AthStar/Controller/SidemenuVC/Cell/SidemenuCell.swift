//
//  SidemenuCell.swift
//  Photonic
//
//  Created by ViPrak-Ankit on 11/01/22.
//

import UIKit

class SidemenuCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var lblMenu: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
