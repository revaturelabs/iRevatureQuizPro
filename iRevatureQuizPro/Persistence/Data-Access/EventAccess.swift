//
//  EventAccess.swift
//  iRevatureQuizPro
//
//  Created by admin on 3/9/20.
//  Copyright © 2020 revature. All rights reserved.
//

import os.log

extension Events {
    
//=====================================
    //Get All Rows
//=====================================
    static func getAll() -> [Events.EventsAllData]? {
        let select = getAllStatement()
        return Database.selectRow(withSelectStatement: select, returnStruct: Events.EventsAllData.self)
    }
    
//=====================================
    //Get A Single Row By Event Code
//=====================================
    static func getBy(eventCode: String) -> Events.EventsAllData? {
        let select = getByStatement(eventCode: eventCode)
        guard let result = Database.selectRow(withSelectStatement: select, returnStruct: Events.EventsAllData.self) else {
            return nil }
        
        return result.first
    }
    
//=====================================
    //Insert Row Into Database
//=====================================
    static func insert(eventName: String, location: String, eventCode: String, quizID: String, ambassadorEmail: String, date: String) {
        let insert = insertStatement(eventName: eventName, location: location, eventCode: eventCode, quizID: quizID, ambassadorEmail: ambassadorEmail, date: date)
        
        if !Database.insertRow(withInsertStatement: insert) {
            os_log(DatabaseErrorMessage.insert, log: OSLog.default, type: .error, Events.tableName)
        }
    }
    
//=====================================
    //Delete Row From Database By ID
//=====================================
    static func delete(eventCode: String) {
        let delete = deleteByStatement(eventCode: eventCode)
        
        if !Database.deleteRow(withDeleteStatement: delete) {
            os_log(DatabaseErrorMessage.delete, log: OSLog.default, type: .error, Events.tableName)
        }
    }
}
