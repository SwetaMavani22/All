//
//  cellSelectFlat.swift
//  iOS_Rajkot
//
//  Created by Mavani on 18/11/22.
//

import Foundation
import UIKit

class cellSelectFlat: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var lblOption: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var imgSelect: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

class cellOptions: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var lblOption: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var btnCheck: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
