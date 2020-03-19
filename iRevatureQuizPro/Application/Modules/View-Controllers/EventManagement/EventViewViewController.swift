//
//  EventViewViewController.swift
//  iRevatureQuizPro
//
//  Created by A Guest on 3/5/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit
import EasySQLite

class EventViewViewController: BaseViewController {
    var eventsArray = [Events.EventsAllData]()
    
    @IBOutlet weak var eventSearchBar: UISearchBar!
    @IBOutlet weak var eventsTable: UITableView!
    
    var managerdelegate = UIApplication.shared.delegate as! AppDelegate
    var manager : EntityManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        eventsTable.dataSource = self
        eventsTable.delegate = self
        
        manager = managerdelegate.manager!
        
          // var sampleQuiz:QuizAPIData
        manager!.loadDataFromAPI()
        
        initArray()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        initArray()
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
    
    func initArray() {
        var statement = ESLSelectStatement()
        statement.specifyColumn(table: Events.table, columnName: Events.ColumnName.quizID.rawValue, asName: Events.ColumnName.quizID.rawValue)
        statement.specifyColumn(table: Events.table, columnName: Events.ColumnName.ambassadorEmail.rawValue, asName: Events.ColumnName.ambassadorEmail.rawValue)
        statement.specifyColumn(table: Events.table, columnName: Events.ColumnName.date.rawValue, asName: Events.ColumnName.date.rawValue)
        statement.specifyColumn(table: Events.table, columnName: Events.ColumnName.eventCode.rawValue, asName: Events.ColumnName.eventCode.rawValue)
        statement.specifyColumn(table: Events.table, columnName: Events.ColumnName.eventName.rawValue, asName: Events.ColumnName.eventName.rawValue)
        statement.specifyColumn(table: Events.table, columnName: Events.ColumnName.location.rawValue, asName: Events.ColumnName.location.rawValue)

        if let databaseArray = Database.selectRow(withSelectStatement: statement, returnStruct: Events.EventsAllData.self) {
            self.eventsArray = databaseArray
        }
        
        eventsTable.reloadData()
    }
}

extension EventViewViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let df = DateFormatter()
        df.dateFormat = "MMM dd, yyyy"
        
        let cell = eventsTable.dequeueReusableCell(withIdentifier: "EventsTableCell", for: indexPath) as! EventCell
        cell.date?.text = df.string(from: eventsArray[indexPath.row].date)
        cell.eventName?.text = eventsArray[indexPath.row].event_name
        cell.location?.text = eventsArray[indexPath.row].location
        cell.quiz.text = "Quiz ID: \(eventsArray[indexPath.row].quiz_id)"
        print(cell)
        return cell
    }
}
