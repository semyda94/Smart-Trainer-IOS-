//
//  MealsViewController.swift
//  Smart Trainer
//
//  Created by Dmitrii Semykin on 12/08/18.
//  Copyright © 2018 Dmitrii Semykin. All rights reserved.
//

import UIKit
import RealmSwift

class MealsViewController: UIViewController{

    // MARK: - Properties
    
    //Database socket
    fileprivate var realm = try! Realm()
    
    //ListOfUsersMeals
    fileprivate var userMeals = [RealmMealInfo]()
    
    
    // MARK: - Outlets
    @IBOutlet weak var mealsTable: UITableView!
    
    // MARK: - Actions
    
    //Temprorary creation of user Meal
    @IBAction func addNewMeal(_ sender: UIBarButtonItem) {
        try! realm.write {
            let tmpMeal = RealmMealInfo()
            tmpMeal.mealDateAndTime = Date()
            userMeals.append(tmpMeal)
            mealsTable.reloadData()
            realm.add(tmpMeal)
        }
        //performSegue(withIdentifier: "CreateNewMeal", sender: self)
    }
    
    // MARK: - View Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Getting list of meals from DB
        userMeals = Array(realm.objects(RealmMealInfo.self))
        
        //Set navigation Bar Large Title Style
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Set Automatic Dimension for meals table rows
        mealsTable.rowHeight = UITableViewAutomaticDimension
        mealsTable.estimatedRowHeight = 70
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

extension MealsViewController : UITableViewDataSource {
    // Number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return userMeals.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let dateForSection = userMeals[section].mealDateAndTime
        let myCalendar = Calendar(identifier: .gregorian)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yy"
        
        var dayOfWeek = ""
        switch myCalendar.component(.weekday, from: dateForSection) {
        case 0:
            dayOfWeek = "Monday"
        case 1:
            dayOfWeek = "Tuesday"
        case 2:
            dayOfWeek = "Wednesday"
        case 3:
            dayOfWeek = "Thursday"
        case 4:
            dayOfWeek = "Friday"
        case 5:
            dayOfWeek = "Saturday"
        case 6:
            dayOfWeek = "Sunday"
        default:
            dayOfWeek = ""
        }
        
        return dateFormatter.string(from: dateForSection) + " - " + dayOfWeek
    }
    
    //Number of Rows In section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    //Cell for Row At position
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mealsTable.dequeueReusableCell(withIdentifier: "MealCell")!
        
        return cell
    }
}

extension MealsViewController: UITableViewDelegate {
    // Turn on Editing of rows
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // Set editing actions for rows
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            try! self.realm.write {
                self.realm.delete(self.userMeals[indexPath.row])
                self.userMeals.remove(at: indexPath.row)
                self.mealsTable.deleteRows(at: [indexPath], with: UITableViewRowAnimation.left)
            }
        }
        
        return [delete]
    }
}
