//
//  MetatagStatements.swift
//  iRevatureQuizPro
//
//  Created by Jeremy Malisse on 3/6/20.
//  Copyright © 2020 revature. All rights reserved.
//

import EasySQLite

extension PQuiz {
//=====================================
    //Select All Metatag Rows Statement
//=====================================
    static func getAllStatement() -> ESLSelectStatement {
        var select = ESLSelectStatement()
        select.getAllColumns(fromTable: PQuiz.table)
        
        return select
    }
    
//=====================================
    //Select Metatag Row By ID Statement
//=====================================
    static func getByStatement(id: Int) -> ESLSelectStatement {
        //Select Statement
        var select = ESLSelectStatement()
        select.getAllColumns(fromTable: PQuiz.table)
        
        //Where Statement
        var `where` =  ESLWhereStatement()
        `where`.addStatement(table: PQuiz.table, columnName: PQuiz.ColumnName.id.rawValue, expression: .EQUALS, columnValue: id)
        
        select.setWhereStatement(statement: `where`)
        
        return select
    }
    
//=====================================
    //Select Metatag Row by Name Statement
//=====================================
    static func getByStatement(name: String) -> ESLSelectStatement {
        //Select Statement
        var select = ESLSelectStatement()
        select.getAllColumns(fromTable: PQuiz.table)
        
        //Where Statement
        var `where` =  ESLWhereStatement()
        `where`.addStatement(table: PQuiz.table, columnName: PQuiz.ColumnName.name.rawValue, expression: .EQUALS, columnValue: name)
        
        select.setWhereStatement(statement: `where`)
        
        return select
    }
    
//=====================================
    //Insert Row Statement
//=====================================
    static func insertStatement(name: String) -> ESLInsertStatement {
        var insert = ESLInsertStatement(table: PQuiz.table)
        insert.specifyValue(columnName: PQuiz.ColumnName.name.rawValue, columnValue: name)
        
        return insert
    }
    
//=====================================
    //Delete Row By ID Statement
//=====================================
    static func deleteByStatement(id: Int) -> ESLDeleteStatement {
        //Delete Statement
        var delete = ESLDeleteStatement(table: PQuiz.table)
        
        //Where Statement
        var `where` = ESLWhereStatement()
        `where`.addStatement(table: PQuiz.table, columnName: PQuiz.ColumnName.id.rawValue, expression: .EQUALS, columnValue: id)
        
        delete.setWhereStatement(statement: `where`)
        
        return delete
    }
    
//=====================================
    //Delete Row By Name Statement
//=====================================
    static func deleteByStatement(name: String) -> ESLDeleteStatement {
        //Delete Statement
        var delete = ESLDeleteStatement(table: PQuiz.table)
        
        //Where Statement
        var `where` = ESLWhereStatement()
        `where`.addStatement(table: PQuiz.table, columnName: PQuiz.ColumnName.name.rawValue, expression: .EQUALS, columnValue: name)
        
        delete.setWhereStatement(statement: `where`)
        
        return delete
    }
}
