//
//  QuestionStatements.swift
//  iRevatureQuizPro
//
//  Created by Wesley Otero on 3/12/20.
//  Copyright © 2020 revature. All rights reserved.
//

import EasySQLite

extension PQuestion {
    
//=====================================
    //Select All Question Rows Statement
//=====================================
    static func getAllStatement() -> ESLSelectStatement {
        var select = ESLSelectStatement()
        
        select.specifyColumn(table: PQuestion.table, columnName: PQuestion.ColumnName.question_id.rawValue,                             asName: PQuestion.ColumnName.question_id.rawValue)
        select.specifyColumn(table: PQuestion.table, columnName: PQuestion.ColumnName.question_name.rawValue, asName: PQuestion.ColumnName.question_name.rawValue)
        select.specifyColumn(table: PQuestion.table, columnName: PQuestion.ColumnName.tags.rawValue, asName: PQuestion.ColumnName.tags.rawValue)
        select.specifyColumn(table: PQuestion.table, columnName: PQuestion.ColumnName.question_type.rawValue, asName: PQuestion.ColumnName.question_type.rawValue)
        

        return select
    }
    
//=====================================
    //Select Quiz Row By ID Statement
//=====================================
    static func getByStatement(id: Int) -> ESLSelectStatement {
        //Select Statement
        var select = ESLSelectStatement()
        
        select.specifyColumn(table: PQuestion.table, columnName: PQuestion.ColumnName.question_id.rawValue,                             asName: PQuestion.ColumnName.question_id.rawValue)
        select.specifyColumn(table: PQuestion.table, columnName: PQuestion.ColumnName.question_name.rawValue, asName: PQuestion.ColumnName.question_name.rawValue)
        select.specifyColumn(table: PQuestion.table, columnName: PQuestion.ColumnName.tags.rawValue, asName: PQuestion.ColumnName.tags.rawValue)
        select.specifyColumn(table: PQuestion.table, columnName: PQuestion.ColumnName.question_type.rawValue, asName: PQuestion.ColumnName.question_type.rawValue)
        
        //Where Statement
        var `where` =  ESLWhereStatement()
        
        `where`.addStatement(table: PQuestion.table, columnName: PQuestion.ColumnName.question_id.rawValue, expression: .EQUALS, columnValue: id)
        
        select.setWhereStatement(statement: `where`)
        
        return select
    }
    
//=====================================
    //Select Question Row by Name Statement
//=====================================
//    static func getByStatement(name: String) -> ESLSelectStatement {
//        //Select Statement
//        var select = ESLSelectStatement()
//        select.getAllColumns(fromTable: PQuestion.table)
//
//        //Where Statement
//        var `where` =  ESLWhereStatement()
//        `where`.addStatement(table: PQuestion.table, columnName: PQuestion.ColumnName.question_name.rawValue, expression: .EQUALS, columnValue: name)
//
//        select.setWhereStatement(statement: `where`)
//
//        return select
//    }
    
//=====================================
    //Insert Row Statement
//=====================================
    // Function takes a Question Object from the Business Layer. There are 6 fields that are .NOTNULL contraint which need to be checked during the API call conversion between the two calls -> business entity struct. By this point they shouldn't require any authentication/verification.
    static func insertStatement(questionObject: QuestionObject) -> ESLInsertStatement {
        
        var insert = ESLInsertStatement(table: PQuestion.table)
        
        insert.specifyValue(columnName: PQuestion.ColumnName.question_id.rawValue,                          columnValue: questionObject.id)
        insert.specifyValue(columnName: PQuestion.ColumnName.question_name.rawValue,                          columnValue: questionObject.title)
        insert.specifyValue(columnName: PQuestion.ColumnName.tags.rawValue,                          columnValue: questionObject.tags)
        insert.specifyValue(columnName: PQuestion.ColumnName.question_type.rawValue,                          columnValue: questionObject.questionType)
        
        return insert
    }
    
//=====================================
    //Delete Question Row By ID Statement
//=====================================
    static func deleteByStatement(id: Int) -> ESLDeleteStatement {
        //Delete Statement
        var delete = ESLDeleteStatement(table: PQuestion.table)
        
        //Where Statement
        var `where` = ESLWhereStatement()
        `where`.addStatement(table: PQuestion.table, columnName: PQuestion.ColumnName.question_id.rawValue, expression: .EQUALS, columnValue: id)
        
        delete.setWhereStatement(statement: `where`)
        
        return delete
    }
    
//=====================================
    //Update Question Row By ID Statement
//=====================================
    static func updateByStatement(questionObject: QuestionObject) -> ESLUpdateStatement {
        //Update Statement
        var update = ESLUpdateStatement(table: PQuestion.table)
        
        update.addValueChange(columnToUpdate: PQuestion.ColumnName.question_name.rawValue,                                  updatedValue: questionObject.title)
        update.addValueChange(columnToUpdate: PQuestion.ColumnName.question_type.rawValue, updatedValue: questionObject.questionType)
        update.addValueChange(columnToUpdate: PQuestion.ColumnName.tags.rawValue, updatedValue: questionObject.tags)
        
        
        //Where Statement
        var `where` = ESLWhereStatement()
        `where`.addStatement(table: PQuestion.table, columnName: PQuestion.ColumnName.question_id.rawValue, expression: .EQUALS, columnValue: questionObject.id)
        
        update.setWhereStatement(statement: `where`)
        
        return update
    }
}
