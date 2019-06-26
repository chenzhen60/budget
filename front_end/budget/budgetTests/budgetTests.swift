//
//  budgetTests.swift
//  budgetTests
//
//  Created by chenzhen on 2019/6/25.
//  Copyright © 2019 chenzhen. All rights reserved.
//

import XCTest
@testable import budget
import RealmSwift

class budgetTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        let realm = RealmUtil.userRealm(username: "chenzhen")!
        
//        let budget = TimeBudget()
//        budget.title = "just a test"
//        budget.endDate = Date()
//
//        try! realm.write {
//            realm.add(budget)
//        }
        
        let budgets = realm.objects(TimeBudget.self)
        for bugget in budgets {
            print(bugget)
        }
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
