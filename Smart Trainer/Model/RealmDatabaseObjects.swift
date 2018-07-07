//
//  RealmDatabaseObjects.swift
//  Smart Trainer
//
//  Created by Dmitrii Semykin on 7/07/18.
//  Copyright © 2018 Dmitrii Semykin. All rights reserved.
//

import Foundation
import RealmSwift

class RealmUserInfo: Object {
    
    @objc dynamic var userID = 0
    
    override static func primaryKey() -> String? {
        return "userID"
    }
    
    @objc dynamic var age = 0
    @objc dynamic var weight = 0
    @objc dynamic var height = 0
    
    // if gender seted false than sex is male otherwise female
    @objc dynamic var gender = false
}
