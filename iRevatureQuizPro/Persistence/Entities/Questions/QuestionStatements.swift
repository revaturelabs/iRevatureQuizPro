//
//  QuestionStatements.swift
//  iRevatureQuiz
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
		
        select.specifyColumn(table: PQuestion.table, columnName: PQuestion.ColumnName.question_id.rawValue,                         	asName: PQuestion.ColumnName.question_id.rawValue)
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
    static func updateByStatement(quizobject: BQuiz) -> ESLUpdateStatement {
        //Update Statement
        var update = ESLUpdateStatement(table: PQuiz.table)
        
        update.addValueChange(columnToUpdate: PQuiz.ColumnName.quiz_name.rawValue,                                  updatedValue: quizobject.quiz_name)
        update.addValueChange(columnToUpdate: PQuiz.ColumnName.quiz_id.rawValue,                                    updatedValue: quizobject.quiz_id)
        update.addValueChange(columnToUpdate: PQuiz.ColumnName.activity_points.rawValue,                            updatedValue: quizobject.activity_points)
        update.addValueChange(columnToUpdate: PQuiz.ColumnName.duration.rawValue,                                   updatedValue: quizobject.duration)
        update.addValueChange(columnToUpdate: PQuiz.ColumnName.max_attempts.rawValue,                               updatedValue: quizobject.max_attempts)
        
        update.addValueChange(columnToUpdate: PQuiz.ColumnName.level_override.rawValue,                             updatedValue: quizobject.level_override)
        update.addValueChange(columnToUpdate: PQuiz.ColumnName.slug.rawValue,                                       updatedValue: quizobject.slug)
        update.addValueChange(columnToUpdate: PQuiz.ColumnName.description.rawValue,                                updatedValue: quizobject.description)
        update.addValueChange(columnToUpdate: PQuiz.ColumnName.meta_description.rawValue,                           updatedValue: quizobject.meta_description)
        update.addValueChange(columnToUpdate: PQuiz.ColumnName.image_url.rawValue,                                  updatedValue: quizobject.image_url)
        
        update.addValueChange(columnToUpdate: PQuiz.ColumnName.pass_percentage.rawValue,                            updatedValue: quizobject.pass_percentage)
        update.addValueChange(columnToUpdate: PQuiz.ColumnName.via_slug.rawValue,                                   updatedValue: quizobject.via_slug)
        update.addValueChange(columnToUpdate: PQuiz.ColumnName.timer.rawValue,                                      updatedValue: quizobject.timer)
        update.addValueChange(columnToUpdate: PQuiz.ColumnName.shuffle_questions.rawValue,                          updatedValue: quizobject.shuffle_questions)
        update.addValueChange(columnToUpdate: PQuiz.ColumnName.shuffle_answers.rawValue,                            updatedValue: quizobject.shuffle_answers)
        
        update.addValueChange(columnToUpdate: PQuiz.ColumnName.display_score_and_result.rawValue,                   updatedValue: quizobject.display_score_and_result)
        update.addValueChange(columnToUpdate: PQuiz.ColumnName.allow_attempt_review.rawValue,                       updatedValue: quizobject.allow_attempt_review)
        update.addValueChange(columnToUpdate: PQuiz.ColumnName.show_whether_correct.rawValue,                       updatedValue: quizobject.show_whether_correct)
        update.addValueChange(columnToUpdate: PQuiz.ColumnName.show_correct_answers_passed.rawValue,                updatedValue: quizobject.show_correct_answers_passed)
        update.addValueChange(columnToUpdate: PQuiz.ColumnName.show_correct_answers_failed.rawValue,                updatedValue: quizobject.show_correct_answers_failed)
        
        update.addValueChange(columnToUpdate: PQuiz.ColumnName.show_answer_explanations.rawValue,                   updatedValue: quizobject.show_answer_explanations)
        update.addValueChange(columnToUpdate: PQuiz.ColumnName.save_and_resume.rawValue,                            updatedValue: quizobject.save_and_resume)
        update.addValueChange(columnToUpdate: PQuiz.ColumnName.instructions.rawValue,                               updatedValue: quizobject.instructions)
        update.addValueChange(columnToUpdate: PQuiz.ColumnName.mode.rawValue,                                       updatedValue: quizobject.mode)
        update.addValueChange(columnToUpdate: PQuiz.ColumnName.created_by.rawValue,                                 updatedValue: quizobject.created_by)
        
        update.addValueChange(columnToUpdate: PQuiz.ColumnName.created_on.rawValue,                                 updatedValue: quizobject.created_on)
        update.addValueChange(columnToUpdate: PQuiz.ColumnName.updated_by.rawValue,                                 updatedValue: quizobject.updated_by)
        update.addValueChange(columnToUpdate: PQuiz.ColumnName.updated_on.rawValue,                                 updatedValue: quizobject.updated_on)
        
        //Where Statement
        var `where` = ESLWhereStatement()
        `where`.addStatement(table: PQuiz.table, columnName: PQuiz.ColumnName.quiz_id.rawValue, expression: .EQUALS, columnValue: quizobject.quiz_id)
        
        update.setWhereStatement(statement: `where`)
        
        return update
    }
}
