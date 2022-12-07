//
//  cellHome.swift
//  InterviewTask_AthStar
//
//  Created by Mavani on 13/10/22.
//

import Foundation
import UIKit

class HomeCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var lblQuotationNumber: UILabel!
    @IBOutlet weak var lblClientName: UILabel!
    @IBOutlet weak var lblCustomerName: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblSecondaryStatus: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
