//
//  PCFViewController.swift
//  Smart Trainer
//
//  Created by Dmitrii Semykin on 5/07/18.
//  Copyright © 2018 Dmitrii Semykin. All rights reserved.
//

import UIKit

class PCFViewController: UIViewController {

    
    @IBOutlet weak var weightField: UITextField!
    @IBOutlet weak var heightField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    
    
    @IBAction func calculateButtonWasTapped(_ sender: UIButton) {
        print("Calculate PCF")
        guard let weight = Double(weightField.text!), let height = Double(heightField.text!), let age = Double(ageField.text!) else { return }
        let calories = 10 * weight + 6.25 * height - 5 * age
        print("Calories: \(calories)")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weightField.keyboardType = .numberPad
        heightField.keyboardType = .numberPad
        ageField.keyboardType = .numberPad

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
