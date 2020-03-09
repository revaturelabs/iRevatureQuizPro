//
//  EventViewViewController.swift
//  iRevatureQuizPro
//
//  Created by A Guest on 3/5/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit
import EasySQLite

class EventViewViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    var eventsArray:[Events.EventsAllData] = []
    
    @IBOutlet weak var eventSearchBar: UISearchBar!
    @IBOutlet weak var eventsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.eventsTable.dataSource = self
        self.eventsTable.delegate = self
        self.eventsArray = initArray()
    }
    
    @IBAction func addEventButton(_ sender: Any) {
        let nextVC = CreateEventViewController.instantiate(fromAppStoryboard: AppStoryboard.EventManagement)
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: false, completion: nil)
    }
    
    @IBAction func optionsButton(_ sender: Any) {
        let nextVC = EmployeeLoginViewController.instantiate(fromAppStoryboard: AppStoryboard.EmployeeLogin)
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: false, completion: nil)
    }
    
    func initArray() -> [Events.EventsAllData]{
        var statement = ESLSelectStatement()
        statement.specifyColumn(table: Events.table, columnName: Events.ColumnName.quizID.rawValue, asName: Events.ColumnName.quizID.rawValue)
        statement.specifyColumn(table: Events.table, columnName: Events.ColumnName.ambassadorEmail.rawValue, asName: Events.ColumnName.ambassadorEmail.rawValue)
        statement.specifyColumn(table: Events.table, columnName: Events.ColumnName.date.rawValue, asName: Events.ColumnName.date.rawValue)
        statement.specifyColumn(table: Events.table, columnName: Events.ColumnName.eventCode.rawValue, asName: Events.ColumnName.eventCode.rawValue)
        statement.specifyColumn(table: Events.table, columnName: Events.ColumnName.eventName.rawValue, asName: Events.ColumnName.eventName.rawValue)
        statement.specifyColumn(table: Events.table, columnName: Events.ColumnName.location.rawValue, asName: Events.ColumnName.location.rawValue)
        
        return Database.selectRow(withSelectStatement: statement, returnStruct: Events.EventsAllData.self)!
        
    }
}
