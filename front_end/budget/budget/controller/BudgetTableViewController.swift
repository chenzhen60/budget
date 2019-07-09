//
//  BudgetTableViewController.swift
//  budget
//
//  Created by chenzhen on 2019/6/26.
//  Copyright © 2019 chenzhen. All rights reserved.
//

import UIKit
import RealmSwift


class BudgetTableViewController: UITableViewController {
    
    private let realm = RealmUtil.userRealm(username: "chenzhen")!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(UINib(nibName: "TimeBudgetTableViewCell", bundle: nil), forCellReuseIdentifier: "TimeBudgetTableViewCell")
        self.tableView.register(UINib(nibName: "MoneyBudgetTableViewCell", bundle: nil), forCellReuseIdentifier: "MoneyBudgetTableViewCell")
        
        
        self.tableView.estimatedRowHeight = 80
    }

    // MARK: - Table view data source
    
    
    /************** table view **************/

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return budgetList().count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let budget = getBudgetByIndex(index: indexPath.row) {
            self.performSegue(withIdentifier: "showTimeItem", sender: budget)
        }
        
    }
    
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let budget = getBudgetByIndex(index: indexPath.row)!
        
        if budget.type == BudgetType.time.rawValue {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TimeBudgetTableViewCell") as! TimeBudgetTableViewCell
            cell.titleLabel.text = budget.title
            cell.endDateLabel.text = CommonUtil.dateFormat(date: budget.endDate)
            let components = Calendar.current.dateComponents([.day], from: Date.init(), to: budget.endDate).day ?? 0
            cell.remaindStrLael.text = "还剩" + String(components) + "天"
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MoneyBudgetTableViewCell") as! MoneyBudgetTableViewCell
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delAction = UITableViewRowAction(style: .destructive, title: "删除") {
            _, indexPath in
            if let budget = self.getBudgetByIndex(index: indexPath.row) {
                self.deleteBudget(budget: budget)
            }
            
        }
        
        let editAction = UITableViewRowAction(style: .normal, title: "编辑") {
            _,indexPath in
        }
        
        let completeAction = UITableViewRowAction(style: .normal, title: "完成") {
            (_, indexPath) in
            if let budget = self.getBudgetByIndex(index: indexPath.row) {
                self.completetBudget(budget: budget)
            }
        }
        
        return [completeAction, editAction, delAction]
    }
    
    
    /************** action **************/
    
    @IBAction func addBtnPress(_ sender: Any) {
        
        let alertController = UIAlertController(title: "请选择", message: nil, preferredStyle: .actionSheet)
        
        let addTimeBudget = UIAlertAction(title: "添加倒计时", style: .default) { (_) in
            self.performSegue(withIdentifier: "addTimeBudget", sender: nil)
        }
        let addMoneyBudget = UIAlertAction(title: "添假预算", style: .default) { (action) in
        }
        
        let cancle = UIAlertAction(title: "取消", style: .default, handler: nil)
        
        alertController.addAction(addTimeBudget)
        alertController.addAction(addMoneyBudget)
        alertController.addAction(cancle)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addTimeBudget" {
            let controller = segue.destination as! AddTimeBudgetTableViewController
            controller.listViewController = self
        } else if segue.identifier == "showTimeItem" {
            let _ = sender as! Budget
        }
    }
    
    
    
    
    
    
    /************** data **************/
    
    func budgetList() -> Results<Budget> {
        return realm.objects(Budget.self).filter("isDelete = false").filter("status != \(BudegetStatus.completed.rawValue)").sorted(byKeyPath: "endDate", ascending: false)
    }
 
    func getBudgetByIndex(index: Int) -> Budget? {
        let budget = budgetList()[index]
        return budget
    }
    

    func deleteBudget(budget: Budget) {
        try! realm.write {
            budget.isDelete = true
        }
        self.tableView.reloadData()
    }
    
    func reloadeListData() {
        self.tableView.reloadData()
    }
    
    func completetBudget(budget: Budget) {
        try! realm.write {
            budget.status = BudegetStatus.completed.rawValue
        }
        self.tableView.reloadData()
    }

}
