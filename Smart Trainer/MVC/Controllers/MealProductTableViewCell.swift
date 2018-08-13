//
//  MealProductTableViewCell.swift
//  Smart Trainer
//
//  Created by Dmitrii Semykin on 12/08/18.
//  Copyright © 2018 Dmitrii Semykin. All rights reserved.
//

import UIKit

class MealProductTableViewCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var productNameTextField: UITextField!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
