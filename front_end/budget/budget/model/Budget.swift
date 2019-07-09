//
//  TimeBudget.swift
//  budget
//
//  Created by chenzhen on 2019/6/26.
//  Copyright © 2019 chenzhen. All rights reserved.
//

import Foundation
import RealmSwift

public enum BudgetType: Int {
    case time
    case money
}

public enum BudegetStatus: Int {
    case processing
    case completed
    case delayed
}


class Budget: Object {
    @objc dynamic var id = ""
    @objc dynamic var type = BudgetType.time.rawValue
    @objc dynamic var title = ""
    @objc dynamic var endDate = Date(timeIntervalSince1970: 1)
    @objc dynamic var status = BudegetStatus.processing.rawValue
    @objc dynamic var isDelete = false
    
    
    override static func primaryKey() -> String? {
        return "id";
    }
}
