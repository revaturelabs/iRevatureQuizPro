//
//  EventTable.swift
//  iRevatureQuizPro
//
//  Created by Nathan Coggins on 3/6/20.
//  Copyright © 2020 revature. All rights reserved.
//

import EasySQLite

//=====================================
    //Events Table information
//=====================================
struct Events: PersistenceTable {
    //Table name
    static let tableName: String = "events"
    
    //Table column names
    enum  ColumnName: String {
        
        case eventName = "event_name"
        case location = "location"
        case eventCode = "event_code"
        case quizID = "quiz_id"
        case ambassadorEmail = "ambassador_email"
        case date = "date"
    }
    
    //Creating the Table
    static var table: ESLTable {
        var table = ESLTable(tableName: tableName)
        table.addColumn(columnName: ColumnName.eventName.rawValue, dataType: .CHAR  , constraints: .NOTNULL)
        table.addColumn(columnName: ColumnName.location.rawValue, dataType: .CHAR, constraints: .NOTNULL)
        table.addColumn(columnName: ColumnName.eventCode.rawValue, dataType: .CHAR, constraints: .PRIMARYKEY, .NOTNULL)
        table.addColumn(columnName: ColumnName.quizID.rawValue, dataType: .CHAR, constraints: nil)
        table.addColumn(columnName: ColumnName.ambassadorEmail.rawValue, dataType: .CHAR, constraints: .NOTNULL)
        table.addColumn(columnName: ColumnName.date.rawValue, dataType: .CHAR, constraints: .NOTNULL)
        
        return table
    }
    
    
}
