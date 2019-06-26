//
//  TimeBudget.swift
//  budget
//
//  Created by chenzhen on 2019/6/26.
//  Copyright © 2019 chenzhen. All rights reserved.
//

import Foundation
import RealmSwift

class TimeBudget: Object {
    @objc dynamic var id = 0
    @objc dynamic var title = ""
    @objc dynamic var endDate = Date(timeIntervalSince1970: 1)
    @objc dynamic var status = 0
    @objc dynamic var isDelete = false
    
    
    override static func primaryKey() -> String? {
        return "id";
    }
}
