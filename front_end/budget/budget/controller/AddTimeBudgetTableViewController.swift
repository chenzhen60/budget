//
//  AddTimeBudgetTableViewController.swift
//  budget
//
//  Created by chenzhen on 2019/7/4.
//  Copyright © 2019 chenzhen. All rights reserved.
//

import UIKit
import RealmSwift

class AddTimeBudgetTableViewController: UITableViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var dateDatePicker: UIDatePicker!
    
    private var budget: Budget!
    private var isUpdate = false
    var listViewController: BudgetTableViewController!
    
    let realm = RealmUtil.userRealm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if budget == nil {
            budget = Budget()
        }
    }

   
    
    @IBAction func preeSaveBtn(_ sender: Any) {
        try! realm!.write {
            budget.type = BudgetType.time.rawValue
            if budget.id.isEmpty {
                budget.id = UUID().uuidString
            }
            if let title = titleTextField.text {
                budget.title = title
            } else {
                let alertController = UIAlertController(title: "提醒", message: "请填写事件标题", preferredStyle: .alert)
                let action = UIAlertAction(title: "知道了", style: .default, handler: nil)
                alertController.addAction(action)
                self.present(alertController, animated: true, completion: nil)
                return
            }
            
            budget.endDate = dateDatePicker.date
            realm!.add(budget)
        }
        listViewController.reloadeListData()
        navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
        
    }
    

}
