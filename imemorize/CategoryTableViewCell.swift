//
//  CategoryTableViewCell.swift
//  imemorize
//
//  Created by Brian Kurzius on 1/9/16.
//  Copyright © 2016 Brian Kurzius. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    // MARK: Properties
    
    @IBOutlet weak var catLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
