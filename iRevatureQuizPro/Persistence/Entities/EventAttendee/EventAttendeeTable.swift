//
//  EventAttendeeTable.swift
//  iRevatureQuizPro
//
//  Created by Mark Hawkins on 3/6/20.
//  Copyright © 2020 revature. All rights reserved.
//

import EasySQLite

//=====================================
    //Metatag Table information
//=====================================
struct PEventAttendee: PersistenceTable {
    //Table's name
    static let tableName = "event_attendee"
    
    //Table's Column Names
    enum ColumnName: String {
        case id = "tag_id"
        case firstName = "first_name"
        case lastName = "last_name"
        case email = "email"
        case phone = "phone"
        case major = "major"
        case highestEduc = "highest_enducation"
        case workAuth = "work_authorization"
    }
    
    //Table
    static var table: ESLTable {
        var table = ESLTable(tableName: tableName)
        table.addColumn(columnName: ColumnName.id.rawValue, dataType: .INTEGER, constraints: .PRIMARYKEY, .AUTOINCREMENT)
        //table.addColumn(columnName: ColumnName.name.rawValue, dataType: .CHAR, constraints: .UNIQUE, .NOTNULL)
        
        return table
    }
}
