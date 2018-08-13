//
//  NewMealViewController.swift
//  Smart Trainer
//
//  Created by Dmitrii Semykin on 12/08/18.
//  Copyright © 2018 Dmitrii Semykin. All rights reserved.
//

import UIKit

class NewMealViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var mealProductsTable: UITableView!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
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

extension NewMealViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mealProductsTable.dequeueReusableCell(withIdentifier: "MealProductCell")!
        
        return cell
    }
    
    
}


