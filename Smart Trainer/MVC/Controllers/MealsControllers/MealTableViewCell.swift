//
//  MealTableViewCell.swift
//  Smart Trainer
//
//  Created by Dmitrii Semykin on 13/08/18.
//  Copyright © 2018 Dmitrii Semykin. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var numberOfMealsLabel: UILabel!
    @IBOutlet weak var amountOfCaloriesLabel: UILabel!
    @IBOutlet weak var dailyRequirementsProcentLabel: UILabel!
    
    // MARK: - Properties
    
    var numberOfMeals = 0 {
        willSet {
            numberOfMealsLabel.text = "\(newValue)"
        }
    }
    
    var amountOfCalories = 0 {
        willSet {
            amountOfCaloriesLabel.text = "\(newValue)"
        }
    }
    
    var dailyRequirementsProcent = 0 {
        willSet {
            dailyRequirementsProcentLabel.text = "\(newValue)"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
