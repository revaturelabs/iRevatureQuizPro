//
//  EventStatements.swift
//  iRevatureQuizPro
//
//  Created by Nathan Coggins on 3/6/20.
//  Copyright © 2020 revature. All rights reserved.
//

import EasySQLite

extension Events{
    //=====================================
    //Select All Events Rows Statement
    //=====================================
    static func getAllStatement() -> ESLSelectStatement {
        var select = ESLSelectStatement()
        select.getAllColumns(fromTable: Events.table)
        
        return select
    }
    
    //=====================================
    //Select Events Row By Event Code Statement
    //=====================================
    static func getByStatement(eventCode: String) -> ESLSelectStatement {
        //Select Statement
        var select = ESLSelectStatement()
        select.getAllColumns(fromTable: Events.table)
        
        //Where Statement
        var `where` =  ESLWhereStatement()
        `where`.addStatement(table: Events.table, columnName: Events.ColumnName.eventCode.rawValue, expression: .EQUALS, columnValue: eventCode)
        
        select.setWhereStatement(statement: `where`)
        
        return select
    }
    
    //=====================================
    //Select Events Row by Ambassador Statement
    //=====================================
    static func getByStatement(ambassador: String) -> ESLSelectStatement {
        //Select Statement
        var select = ESLSelectStatement()
        select.getAllColumns(fromTable: Events.table)
        
        //Where Statement
        var `where` =  ESLWhereStatement()
        `where`.addStatement(table: Events.table, columnName: Events.ColumnName.ambassadorEmail.rawValue, expression: .EQUALS, columnValue: ambassador)
        
        select.setWhereStatement(statement: `where`)
        
        return select
    }
    
    //=====================================
    //Select Events Row by Quiz ID Statement
    //=====================================
       static func getByStatement(quizID: Int) -> ESLSelectStatement {
           //Select Statement
           var select = ESLSelectStatement()
           select.getAllColumns(fromTable: Events.table)
           
           //Where Statement
           var `where` =  ESLWhereStatement()
           `where`.addStatement(table: Events.table, columnName: Events.ColumnName.quizID.rawValue, expression: .EQUALS, columnValue: quizID)
           
           select.setWhereStatement(statement: `where`)
           
           return select
       }
    
    //=====================================
    //Insert Row Statement
    //=====================================
    static func insertStatement(eventName: String, location: String, eventCode: String, ambassadorEmail: String, date: String) -> ESLInsertStatement {
        var insert = ESLInsertStatement(table: Events.table)
        insert.specifyValue(columnName: Events.ColumnName.eventName.rawValue, columnValue: eventName)
        insert.specifyValue(columnName: Events.ColumnName.location.rawValue, columnValue: location)
        insert.specifyValue(columnName: Events.ColumnName.eventCode.rawValue, columnValue: eventCode)
        insert.specifyValue(columnName: Events.ColumnName.ambassadorEmail.rawValue, columnValue: ambassadorEmail)
        insert.specifyValue(columnName: Events.ColumnName.date.rawValue, columnValue: date)
        
        return insert
    }
    
    //=====================================
    //Delete Row By Event Code Statement
    //=====================================
    static func deleteByStatement(eventCode: String) -> ESLDeleteStatement {
        //Delete Statement
        var delete = ESLDeleteStatement(table: Events.table)
        
        //Where Statement
        var `where` = ESLWhereStatement()
        `where`.addStatement(table: Events.table, columnName: Events.ColumnName.eventCode.rawValue, expression: .EQUALS, columnValue: eventCode)
        
        delete.setWhereStatement(statement: `where`)
        
        return delete
    }
    
    //=====================================
    //Delete Row By Quiz ID Statement
    //=====================================
    static func deleteByStatement(quizID: Int) -> ESLDeleteStatement {
        //Delete Statement
        var delete = ESLDeleteStatement(table: Events.table)
        
        //Where Statement
        var `where` = ESLWhereStatement()
        `where`.addStatement(table: Events.table, columnName: Events.ColumnName.quizID.rawValue, expression: .EQUALS, columnValue: quizID)
        
        delete.setWhereStatement(statement: `where`)
        
        return delete
    }
}

