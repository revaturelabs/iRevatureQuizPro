//
//  QuizStatements.swift
//  iRevatureQuizPro
//
//  Created by Jeremy Malisse on 3/6/20.
//  Copyright © 2020 revature. All rights reserved.
//

import EasySQLite

extension PQuiz {
//=====================================
    //Select All Quiz Rows Statement
//=====================================
    static func getAllStatement() -> ESLSelectStatement {
        var select = ESLSelectStatement()
		
		select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.id.rawValue, asName: PQuiz.ColumnName.id.rawValue)
		select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.title.rawValue, asName: PQuiz.ColumnName.title.rawValue)
		select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.description.rawValue, asName: PQuiz.ColumnName.description.rawValue)
		select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.metaTags.rawValue, asName: PQuiz.ColumnName.metaTags.rawValue)
		select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.categoryName.rawValue, asName: PQuiz.ColumnName.categoryName.rawValue)
		
        return select
    }
    
//=====================================
    //Select Quiz Row By ID Statement
//=====================================
    static func getByStatement(id: Int) -> ESLSelectStatement {
        //Select Statement
        var select = ESLSelectStatement()
		select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.id.rawValue, asName: PQuiz.ColumnName.id.rawValue)
        
        //Where Statement
        var `where` =  ESLWhereStatement()
		`where`.addStatement(table: PQuiz.table, columnName: PQuiz.ColumnName.id.rawValue, expression: .EQUALS, columnValue: id)
        
        select.setWhereStatement(statement: `where`)
        
        return select
    }
    
//=====================================
    //Select Quiz Row by Name Statement
//=====================================
    static func getByStatement(name: String) -> ESLSelectStatement {
        //Select Statement
        var select = ESLSelectStatement()
        select.getAllColumns(fromTable: PQuiz.table)
        
        //Where Statement
        var `where` =  ESLWhereStatement()
		`where`.addStatement(table: PQuiz.table, columnName: PQuiz.ColumnName.title.rawValue, expression: .EQUALS, columnValue: name)
        
        select.setWhereStatement(statement: `where`)
        
        return select
    }
    
//=====================================
    //Insert Row Statement
//=====================================
    // Function takes a BQuiz object from the Business Layer. There are 6 fields that are .NOTNULL contraint which need to be checked during the API call conversion between the two calls -> business entity struct. By this point they shouldn't require any authentication/verification.
    static func insertStatement(quizobject: BQuiz) -> ESLInsertStatement {
        
        var insert = ESLInsertStatement(table: PQuiz.table)
		
		insert.specifyValue(columnName: PQuiz.ColumnName.id.rawValue, columnValue: quizobject.id)
		insert.specifyValue(columnName: PQuiz.ColumnName.title.rawValue, columnValue: quizobject.title)
		insert.specifyValue(columnName: PQuiz.ColumnName.description.rawValue, columnValue: quizobject.description)
		insert.specifyValue(columnName: PQuiz.ColumnName.metaTags.rawValue, columnValue: quizobject.metaTags ?? "none_given")
		insert.specifyValue(columnName: PQuiz.ColumnName.categoryName.rawValue, columnValue: quizobject.categoryName)
        
//		insert.specifyValue(columnName: PQuiz.ColumnName.quiz_id.rawValue,                          columnValue: quizobject.quiz_id)
//
        return insert
    }
    
//=====================================
    //Delete Quiz Row By ID Statement
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
    //Update Quiz Row By ID Statement
//=====================================
    static func updateByStatement(quizobject: BQuiz) -> ESLUpdateStatement {
        //Update Statement
        var update = ESLUpdateStatement(table: PQuiz.table)
		
		update.addValueChange(columnToUpdate: PQuiz.ColumnName.id.rawValue, updatedValue: quizobject.id)
		update.addValueChange(columnToUpdate: PQuiz.ColumnName.title.rawValue, updatedValue: quizobject.title)
		update.addValueChange(columnToUpdate: PQuiz.ColumnName.description.rawValue, updatedValue: quizobject.description)
		update.addValueChange(columnToUpdate: PQuiz.ColumnName.metaTags.rawValue, updatedValue: quizobject.metaTags ?? "none_given")
		update.addValueChange(columnToUpdate: PQuiz.ColumnName.categoryName.rawValue, updatedValue: quizobject.categoryName)
		
		var `where` = ESLWhereStatement()
		`where`.addStatement(table: PQuiz.table, columnName: PQuiz.ColumnName.id.rawValue, expression: .EQUALS, columnValue: quizobject.id)
		
		update.setWhereStatement(statement: `where`)

        return update
    }
}
