//
//  EventAttendeeStatements.swift
//  iRevatureQuizPro
//
//  Created by Mark Hawkins on 3/6/20.
//  Copyright © 2020 revature. All rights reserved.
//

import EasySQLite

extension PEventAttendee {
//=====================================
    //Select All Attendees Rows Statement
//=====================================
    static func getAllStatement() -> ESLSelectStatement {
        var select = ESLSelectStatement()
        select.specifyColumn(table: table, columnName: ColumnName.id.rawValue, asName: ColumnName.id.rawValue)
        select.specifyColumn(table: table, columnName: ColumnName.firstName.rawValue, asName: ColumnName.firstName.rawValue)
        select.specifyColumn(table: table, columnName: ColumnName.lastName.rawValue, asName: ColumnName.lastName.rawValue)
        select.specifyColumn(table: table, columnName: ColumnName.email.rawValue, asName: ColumnName.email.rawValue)
        select.specifyColumn(table: table, columnName: ColumnName.phone.rawValue, asName: ColumnName.phone.rawValue)
        select.specifyColumn(table: table, columnName: ColumnName.major.rawValue, asName: ColumnName.major.rawValue)
        select.specifyColumn(table: table, columnName: ColumnName.highestEduc.rawValue, asName: ColumnName.highestEduc.rawValue)
        select.specifyColumn(table: table, columnName: ColumnName.workAuth.rawValue, asName: ColumnName.workAuth.rawValue)
        
        return select
    }
    
//=====================================
    //Select Attendee Row By ID Statement
//=====================================
    static func getByStatement(id: Int) -> ESLSelectStatement {
        //Select Statement
        var select = ESLSelectStatement()
        select.specifyColumn(table: table, columnName: ColumnName.id.rawValue, asName: ColumnName.id.rawValue)
        select.specifyColumn(table: table, columnName: ColumnName.firstName.rawValue, asName: ColumnName.firstName.rawValue)
        select.specifyColumn(table: table, columnName: ColumnName.lastName.rawValue, asName: ColumnName.lastName.rawValue)
        select.specifyColumn(table: table, columnName: ColumnName.email.rawValue, asName: ColumnName.email.rawValue)
        select.specifyColumn(table: table, columnName: ColumnName.phone.rawValue, asName: ColumnName.phone.rawValue)
        select.specifyColumn(table: table, columnName: ColumnName.major.rawValue, asName: ColumnName.major.rawValue)
        select.specifyColumn(table: table, columnName: ColumnName.highestEduc.rawValue, asName: ColumnName.highestEduc.rawValue)
        select.specifyColumn(table: table, columnName: ColumnName.workAuth.rawValue, asName: ColumnName.workAuth.rawValue)
        
        //Where Statement
        var `where` =  ESLWhereStatement()
        `where`.addStatement(table: PEventAttendee.table, columnName: PEventAttendee.ColumnName.id.rawValue, expression: .EQUALS, columnValue: id)
        
        select.setWhereStatement(statement: `where`)
        
        return select
    }
    
//=====================================
    //Insert Row Statement
//=====================================
    static func insertStatement(firstName: String, lastName: String, email: String, phoneNumber: Int, major: String, highestEducation: String, worthAuthority: String) -> ESLInsertStatement {
        var insert = ESLInsertStatement(table: PEventAttendee.table)
        insert.specifyValue(columnName: PEventAttendee.ColumnName.firstName.rawValue, columnValue: firstName)
        insert.specifyValue(columnName: PEventAttendee.ColumnName.lastName.rawValue, columnValue: lastName)
        insert.specifyValue(columnName: PEventAttendee.ColumnName.email.rawValue, columnValue: email)
        insert.specifyValue(columnName: PEventAttendee.ColumnName.phone.rawValue, columnValue: phoneNumber)
        insert.specifyValue(columnName: PEventAttendee.ColumnName.major.rawValue, columnValue: major)
        insert.specifyValue(columnName: PEventAttendee.ColumnName.highestEduc.rawValue, columnValue: highestEducation)
        insert.specifyValue(columnName: PEventAttendee.ColumnName.workAuth.rawValue, columnValue: worthAuthority)
        
        return insert
    }
    
//=====================================
    //Delete Row By ID Statement
//=====================================
    static func deleteByStatement(id: Int) -> ESLDeleteStatement {
        //Delete Statement
        var delete = ESLDeleteStatement(table: PEventAttendee.table)
        
        //Where Statement
        var `where` = ESLWhereStatement()
        `where`.addStatement(table: PEventAttendee.table, columnName: PEventAttendee.ColumnName.id.rawValue, expression: .EQUALS, columnValue: id)
        
        delete.setWhereStatement(statement: `where`)
        
        return delete
    }
    
}
