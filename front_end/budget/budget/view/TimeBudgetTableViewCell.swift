//
//  TimeBudgetTableViewCell.swift
//  budget
//
//  Created by chenzhen on 2019/6/26.
//  Copyright © 2019 chenzhen. All rights reserved.
//

import UIKit

class TimeBudgetTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var remaindStrLael: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
