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
//    static func getAllStatement() -> ESLSelectStatement {
//        var select = ESLSelectStatement()
//        select.getAllColumns(fromTable: PQuiz.table)
//
//        return select // currently doesnt work? mark says dont use atm
//    }
    
//=====================================
    //Select Quiz Row By ID Statement
//=====================================
    static func getByStatement(id: Int) -> ESLSelectStatement {
        //Select Statement
        var select = ESLSelectStatement()
        select.getAllColumns(fromTable: PQuiz.table)
        
        //Where Statement
        var `where` =  ESLWhereStatement()
        `where`.addStatement(table: PQuiz.table, columnName: PQuiz.ColumnName.quiz_id.rawValue, expression: .EQUALS, columnValue: id)
        
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
        `where`.addStatement(table: PQuiz.table, columnName: PQuiz.ColumnName.quiz_name.rawValue, expression: .EQUALS, columnValue: name)
        
        select.setWhereStatement(statement: `where`)
        
        return select
    }
    
//=====================================
    //Insert Row Statement
//=====================================
    // Function takes a BQuiz object from the Business Layer. There are 6 fields that are .NOTNULL contraint which need to be checked during the API call conversion between the two calls -> business entity struct. By this point they shouldn't require any authentication/verification.
    static func insertStatement(quizobject: BQuiz) -> ESLInsertStatement {
        
        var insert = ESLInsertStatement(table: PQuiz.table)
        
        insert.specifyValue(columnName: PQuiz.ColumnName.quiz_name.rawValue, columnValue: quizobject.quiz_name)
        insert.specifyValue(columnName: PQuiz.ColumnName.quiz_id.rawValue, columnValue: quizobject.quiz_id)
        insert.specifyValue(columnName: PQuiz.ColumnName.activity_points.rawValue, columnValue: quizobject.activity_points)
        insert.specifyValue(columnName: PQuiz.ColumnName.duration.rawValue, columnValue: quizobject.duration)
        insert.specifyValue(columnName: PQuiz.ColumnName.max_attempts.rawValue, columnValue: quizobject.max_attempts)
        insert.specifyValue(columnName: PQuiz.ColumnName.level_override.rawValue, columnValue: quizobject.level_override)
        insert.specifyValue(columnName: PQuiz.ColumnName.slug.rawValue, columnValue: quizobject.slug)
        insert.specifyValue(columnName: PQuiz.ColumnName.description.rawValue, columnValue: quizobject.description)
        
        insert.specifyValue(columnName: PQuiz.ColumnName.meta_description.rawValue, columnValue: quizobject.meta_description)
        insert.specifyValue(columnName: PQuiz.ColumnName.image_url.rawValue, columnValue: quizobject.image_url)
        insert.specifyValue(columnName: PQuiz.ColumnName.pass_percentage.rawValue, columnValue: quizobject.pass_percentage)
        insert.specifyValue(columnName: PQuiz.ColumnName.via_slug.rawValue, columnValue: quizobject.via_slug)
        insert.specifyValue(columnName: PQuiz.ColumnName.timer.rawValue, columnValue: quizobject.timer)
        
        insert.specifyValue(columnName: PQuiz.ColumnName.shuffle_questions.rawValue, columnValue: quizobject.shuffle_questions)
        insert.specifyValue(columnName: PQuiz.ColumnName.shuffle_answers.rawValue, columnValue: quizobject.shuffle_answers)
        insert.specifyValue(columnName: PQuiz.ColumnName.display_score_and_result.rawValue, columnValue: quizobject.display_score_and_result)
        insert.specifyValue(columnName: PQuiz.ColumnName.allow_attempt_review.rawValue, columnValue: quizobject.allow_attempt_review)
        insert.specifyValue(columnName: PQuiz.ColumnName.show_whether_correct.rawValue, columnValue: quizobject.show_whether_correct)
        
        insert.specifyValue(columnName: PQuiz.ColumnName.show_correct_answers_passed.rawValue, columnValue: quizobject.show_correct_answers_passed)
        insert.specifyValue(columnName: PQuiz.ColumnName.show_correct_answers_failed.rawValue, columnValue: quizobject.show_correct_answers_failed)
        insert.specifyValue(columnName: PQuiz.ColumnName.show_answer_explanations.rawValue, columnValue: quizobject.show_answer_explanations)
        insert.specifyValue(columnName: PQuiz.ColumnName.save_and_resume.rawValue, columnValue: quizobject.save_and_resume)
        insert.specifyValue(columnName: PQuiz.ColumnName.instructions.rawValue, columnValue: quizobject.instructions)
        
        insert.specifyValue(columnName: PQuiz.ColumnName.mode.rawValue, columnValue: quizobject.mode)
        insert.specifyValue(columnName: PQuiz.ColumnName.created_by.rawValue, columnValue: quizobject.created_by)
        insert.specifyValue(columnName: PQuiz.ColumnName.created_on.rawValue, columnValue: quizobject.created_on)
        insert.specifyValue(columnName: PQuiz.ColumnName.updated_by.rawValue, columnValue: quizobject.updated_by)
        insert.specifyValue(columnName: PQuiz.ColumnName.updated_on.rawValue, columnValue: quizobject.updated_on)
        
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
        `where`.addStatement(table: PQuiz.table, columnName: PQuiz.ColumnName.quiz_id.rawValue, expression: .EQUALS, columnValue: id)
        
        delete.setWhereStatement(statement: `where`)
        
        return delete
    }
    
//=====================================
    //Update Quiz Row By ID Statement
//=====================================
    static func updateByStatement(id: String) -> ESLUpdateStatement {
        //Delete Statement
        var update = ESLUpdateStatement(table: PQuiz.table)
        
        //Where Statement
        var `where` = ESLWhereStatement()
        `where`.addStatement(table: PQuiz.table, columnName: PQuiz.ColumnName.quiz_id.rawValue, expression: .EQUALS, columnValue: id)
        
        update.setWhereStatement(statement: `where`)
        
        return update
    }
}
