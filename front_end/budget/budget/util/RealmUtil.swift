//
//  RealmUtil.swift
//  budget
//
//  Created by chenzhen on 2019/6/26.
//  Copyright © 2019 chenzhen. All rights reserved.
//

import Foundation
import RealmSwift

struct RealmUtil {
    public static func userRealm(username: String) -> Realm? {
        var config = Realm.Configuration()
        config.fileURL = config.fileURL!.deletingLastPathComponent().appendingPathComponent("\(username).realm")
        
        let realm = try? Realm(configuration: config)
        return realm        
    }
}
