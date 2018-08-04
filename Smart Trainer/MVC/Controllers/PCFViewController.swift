//
//  PCFViewController.swift
//  Smart Trainer
//
//  Created by Dmitrii Semykin on 5/07/18.
//  Copyright © 2018 Dmitrii Semykin. All rights reserved.
//

import UIKit
import RealmSwift

enum mealPlans:Int {
    case Cutting = 0
    case Maintenance = 1
    case Bulking = 2
    case LowerCarb = 3
    case Moderate = 4
    case HigherCarb = 5
}

class PCFViewController: UIViewController {
    
    // MARK: - Proerties
    let realm = try! Realm()
    
    var userInfo : RealmUserInfo!
    
    var additionalCalories = 0.0
    var proteinCoefficient = 0.3
    var carbCoefficient = 0.35
    var fatCoefficient = 0.35

    // MARK: - Outlets
    @IBOutlet weak var weightField: UITextField!
    @IBOutlet weak var heightField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var proteinLabel: UILabel!
    @IBOutlet weak var carbsLabel: UILabel!
    @IBOutlet weak var fatLabel: UILabel!
    
    
    @IBOutlet weak var cuttingButton: SelectableButtonWithID!
    @IBOutlet weak var maintenanceButton: SelectableButtonWithID!
    @IBOutlet weak var bulkingButton: SelectableButtonWithID!
    
    @IBOutlet weak var lowerCarbButton: SelectableButtonWithID!
    @IBOutlet weak var moderateButton: SelectableButtonWithID!
    @IBOutlet weak var higherCarbButton: SelectableButtonWithID!
    
    
    
    
    // MARK: - Actions
    @IBAction func calculateButtonWasTapped(_ sender: UIButton) {
        calculatePCF()
    }
    
    @IBAction func selectedOrChangedMealPlan(_ sender: SelectableButtonWithID) {
        
        switch sender.mealPlanType {
        case cuttingButton.mealPlanType:
            additionalCalories = -500
            calculatePCF()
        case maintenanceButton.mealPlanType:
            additionalCalories = 0
            calculatePCF()
        case bulkingButton.mealPlanType:
            additionalCalories = 500
            calculatePCF()
        case lowerCarbButton.mealPlanType:
            proteinCoefficient = 0.4
            carbCoefficient = 0.2
            fatCoefficient = 0.4
            calculatePCF()
        case moderateButton.mealPlanType:
            proteinCoefficient = 0.3
            carbCoefficient = 0.35
            fatCoefficient = 0.35
            calculatePCF()
        case higherCarbButton.mealPlanType:
            proteinCoefficient = 0.30
            carbCoefficient = 0.5
            fatCoefficient = 0.2
            calculatePCF()
        default:
            additionalCalories = 0
            calculatePCF()
        }
    }
    
    
    
    // MARK: - Methods
    func calculatePCF() {
        print("Calculate PCF")
        guard let weight = Double(weightField.text!), let height = Double(heightField.text!), let age = Double(ageField.text!) else { return }
        let calories = 10 * weight + 6.25 * height - 5 * age + 500 + additionalCalories
        let protein = calories * proteinCoefficient / 4
        let carbs = calories * carbCoefficient / 4
        let fat = calories * fatCoefficient / 9
        
        print("Calories: \(calories)")
        print("Additional Calories: \(additionalCalories)")
        print("Protein: \(protein)")
        print("Carbs: \(carbs)")
        print("Fat: \(fat)")
        
        caloriesLabel.text = "\(calories.rounded())"
        proteinLabel.text = "\(protein.rounded())"
        carbsLabel.text = "\(carbs.rounded())"
        fatLabel.text = "\(fat.rounded())"
        
        try! realm.write {
            userInfo.weight = Int(weight)
            userInfo.height = Int(height)
            userInfo.age = Int(age)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weightField.keyboardType = .numberPad
        heightField.keyboardType = .numberPad
        ageField.keyboardType = .numberPad
        
        if let userInfo = realm.object(ofType: RealmUserInfo.self, forPrimaryKey: 0) {
            self.userInfo = userInfo
        } else {
           try! realm.write {
                self.userInfo = RealmUserInfo()
                realm.add(userInfo)

            }
        }
        
        cuttingButton.mealPlanType = mealPlans.Cutting
        maintenanceButton.mealPlanType = mealPlans.Maintenance
        bulkingButton.mealPlanType = mealPlans.Bulking
        lowerCarbButton.mealPlanType = mealPlans.LowerCarb
        moderateButton.mealPlanType = mealPlans.Moderate
        higherCarbButton.mealPlanType = mealPlans.HigherCarb
        
        weightField.text = "\(userInfo.weight)"
        heightField.text = "\(userInfo.height)"
        ageField.text = "\(userInfo.age)"
        
        calculatePCF()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
