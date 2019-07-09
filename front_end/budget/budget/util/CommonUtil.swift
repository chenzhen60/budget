//
//  Common.swift
//  budget
//
//  Created by chenzhen on 2019/6/28.
//  Copyright © 2019 chenzhen. All rights reserved.
//

import Foundation


struct CommonUtil {
    public static func dateFormat(date: Date, format: String = "YYYY-MM-dd") -> String {
        let myFormatter = DateFormatter()
        myFormatter.dateFormat = format
        return myFormatter.string(from: date)
    }
}
