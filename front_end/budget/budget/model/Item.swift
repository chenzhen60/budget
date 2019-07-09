//
//  Item.swift
//  budget
//
//  Created by chenzhen on 2019/7/9.
//  Copyright © 2019 chenzhen. All rights reserved.
//

import Foundation
import RealmSwift

public enum ItemStatus: Int {
    case processing
    case completed
}


class Item: Object {
    @objc dynamic var id = ""
    @objc dynamic var title = ""
    @objc dynamic var status = ItemStatus.processing.rawValue
    @objc dynamic var isDelete = false
    @objc dynamic var budgetId = -1
    
    
    override static func primaryKey() -> String? {
        return "id";
    }
}
