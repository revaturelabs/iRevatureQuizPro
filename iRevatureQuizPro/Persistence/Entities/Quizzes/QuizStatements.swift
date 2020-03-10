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
		
		select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.quiz_id.rawValue,                         	asName: PQuiz.ColumnName.quiz_id.rawValue)
		select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.quiz_name.rawValue,                           asName: PQuiz.ColumnName.quiz_name.rawValue)
		select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.activity_points.rawValue,                   	asName: PQuiz.ColumnName.activity_points.rawValue)
		select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.duration.rawValue,                          	asName: PQuiz.ColumnName.duration.rawValue)
		select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.max_attempts.rawValue,                      	asName: PQuiz.ColumnName.max_attempts.rawValue)
		
		select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.level_override.rawValue,						asName: PQuiz.ColumnName.level_override.rawValue)
		select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.slug.rawValue,                            	asName: PQuiz.ColumnName.slug.rawValue)
		select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.description.rawValue,                      	asName: PQuiz.ColumnName.description.rawValue)
		select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.meta_description.rawValue, 					asName: PQuiz.ColumnName.meta_description.rawValue)
		select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.image_url.rawValue, 							asName: PQuiz.ColumnName.image_url.rawValue)
		
		select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.pass_percentage.rawValue,					 	asName: PQuiz.ColumnName.pass_percentage.rawValue)
		select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.via_slug.rawValue,					 		asName: PQuiz.ColumnName.via_slug.rawValue)
		select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.timer.rawValue,					 			asName: PQuiz.ColumnName.timer.rawValue)
		select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.shuffle_questions.rawValue,					asName: PQuiz.ColumnName.shuffle_questions.rawValue)
		select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.shuffle_answers.rawValue,					 	asName: PQuiz.ColumnName.shuffle_answers.rawValue)
		
		select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.display_score_and_result.rawValue,			asName: PQuiz.ColumnName.display_score_and_result.rawValue)
		select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.allow_attempt_review.rawValue,			 	asName: PQuiz.ColumnName.allow_attempt_review.rawValue)
		select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.show_whether_correct.rawValue,			 	asName: PQuiz.ColumnName.show_whether_correct.rawValue)
		select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.show_correct_answers_passed.rawValue,			asName: PQuiz.ColumnName.show_correct_answers_passed.rawValue)
		select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.show_correct_answers_failed.rawValue,			asName: PQuiz.ColumnName.show_correct_answers_failed.rawValue)
		
		select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.show_answer_explanations.rawValue,			asName: PQuiz.ColumnName.show_answer_explanations.rawValue)
		select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.save_and_resume.rawValue,			 			asName: PQuiz.ColumnName.save_and_resume.rawValue)
		select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.instructions.rawValue,			 			asName: PQuiz.ColumnName.instructions.rawValue)
		select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.mode.rawValue,			 					asName: PQuiz.ColumnName.mode.rawValue)
		select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.created_by.rawValue,			 				asName: PQuiz.ColumnName.created_by.rawValue)
		
		select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.created_on.rawValue, 							asName: PQuiz.ColumnName.created_on.rawValue)
		select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.updated_by.rawValue, 							asName: PQuiz.ColumnName.updated_by.rawValue)
		select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.updated_on.rawValue, 							asName: PQuiz.ColumnName.updated_on.rawValue)

        return select
    }
    
//=====================================
    //Select Quiz Row By ID Statement
//=====================================
    static func getByStatement(id: Int) -> ESLSelectStatement {
        //Select Statement
        var select = ESLSelectStatement()
        select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.quiz_id.rawValue,                         	asName: PQuiz.ColumnName.quiz_id.rawValue)
		select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.quiz_name.rawValue,                           asName: PQuiz.ColumnName.quiz_name.rawValue)
        select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.activity_points.rawValue,                   	asName: PQuiz.ColumnName.activity_points.rawValue)
        select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.duration.rawValue,                          	asName: PQuiz.ColumnName.duration.rawValue)
        select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.max_attempts.rawValue,                      	asName: PQuiz.ColumnName.max_attempts.rawValue)
        
		select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.level_override.rawValue,						asName: PQuiz.ColumnName.level_override.rawValue)
        select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.slug.rawValue,                            	asName: PQuiz.ColumnName.slug.rawValue)
        select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.description.rawValue,                      	asName: PQuiz.ColumnName.description.rawValue)
        select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.meta_description.rawValue, 					asName: PQuiz.ColumnName.meta_description.rawValue)
        select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.image_url.rawValue, 							asName: PQuiz.ColumnName.image_url.rawValue)
        
        select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.pass_percentage.rawValue,					 	asName: PQuiz.ColumnName.pass_percentage.rawValue)
        select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.via_slug.rawValue,					 		asName: PQuiz.ColumnName.via_slug.rawValue)
        select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.timer.rawValue,					 			asName: PQuiz.ColumnName.timer.rawValue)
        select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.shuffle_questions.rawValue,					asName: PQuiz.ColumnName.shuffle_questions.rawValue)
        select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.shuffle_answers.rawValue,					 	asName: PQuiz.ColumnName.shuffle_answers.rawValue)
        
        select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.display_score_and_result.rawValue,			asName: PQuiz.ColumnName.display_score_and_result.rawValue)
        select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.allow_attempt_review.rawValue,			 	asName: PQuiz.ColumnName.allow_attempt_review.rawValue)
        select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.show_whether_correct.rawValue,			 	asName: PQuiz.ColumnName.show_whether_correct.rawValue)
        select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.show_correct_answers_passed.rawValue,			asName: PQuiz.ColumnName.show_correct_answers_passed.rawValue)
        select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.show_correct_answers_failed.rawValue,			asName: PQuiz.ColumnName.show_correct_answers_failed.rawValue)
        
        select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.show_answer_explanations.rawValue,			asName: PQuiz.ColumnName.show_answer_explanations.rawValue)
        select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.save_and_resume.rawValue,			 			asName: PQuiz.ColumnName.save_and_resume.rawValue)
        select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.instructions.rawValue,			 			asName: PQuiz.ColumnName.instructions.rawValue)
        select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.mode.rawValue,			 					asName: PQuiz.ColumnName.mode.rawValue)
        select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.created_by.rawValue,			 				asName: PQuiz.ColumnName.created_by.rawValue)
        
        select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.created_on.rawValue, 							asName: PQuiz.ColumnName.created_on.rawValue)
        select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.updated_by.rawValue, 							asName: PQuiz.ColumnName.updated_by.rawValue)
        select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.updated_on.rawValue, 							asName: PQuiz.ColumnName.updated_on.rawValue)
        
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
        
		insert.specifyValue(columnName: PQuiz.ColumnName.quiz_id.rawValue,                          columnValue: quizobject.quiz_id)
        insert.specifyValue(columnName: PQuiz.ColumnName.quiz_name.rawValue,                        columnValue: quizobject.quiz_name)
        insert.specifyValue(columnName: PQuiz.ColumnName.activity_points.rawValue,                  columnValue: quizobject.activity_points)
        insert.specifyValue(columnName: PQuiz.ColumnName.duration.rawValue,                         columnValue: quizobject.duration)
        insert.specifyValue(columnName: PQuiz.ColumnName.max_attempts.rawValue,                     columnValue: quizobject.max_attempts)
        
        insert.specifyValue(columnName: PQuiz.ColumnName.level_override.rawValue,                   columnValue: quizobject.level_override)
        insert.specifyValue(columnName: PQuiz.ColumnName.slug.rawValue,                             columnValue: quizobject.slug)
        insert.specifyValue(columnName: PQuiz.ColumnName.description.rawValue,                      columnValue: quizobject.description)
        insert.specifyValue(columnName: PQuiz.ColumnName.meta_description.rawValue,                 columnValue: quizobject.meta_description)
        insert.specifyValue(columnName: PQuiz.ColumnName.image_url.rawValue,                        columnValue: quizobject.image_url)
        
        insert.specifyValue(columnName: PQuiz.ColumnName.pass_percentage.rawValue,                  columnValue: quizobject.pass_percentage)
        insert.specifyValue(columnName: PQuiz.ColumnName.via_slug.rawValue,                         columnValue: quizobject.via_slug)
        insert.specifyValue(columnName: PQuiz.ColumnName.timer.rawValue,                            columnValue: quizobject.timer)
        insert.specifyValue(columnName: PQuiz.ColumnName.shuffle_questions.rawValue,                columnValue: quizobject.shuffle_questions)
        insert.specifyValue(columnName: PQuiz.ColumnName.shuffle_answers.rawValue,                  columnValue: quizobject.shuffle_answers)
        
        insert.specifyValue(columnName: PQuiz.ColumnName.display_score_and_result.rawValue,         columnValue: quizobject.display_score_and_result)
        insert.specifyValue(columnName: PQuiz.ColumnName.allow_attempt_review.rawValue,             columnValue: quizobject.allow_attempt_review)
        insert.specifyValue(columnName: PQuiz.ColumnName.show_whether_correct.rawValue,             columnValue: quizobject.show_whether_correct)
        insert.specifyValue(columnName: PQuiz.ColumnName.show_correct_answers_passed.rawValue,      columnValue: quizobject.show_correct_answers_passed)
        insert.specifyValue(columnName: PQuiz.ColumnName.show_correct_answers_failed.rawValue,      columnValue: quizobject.show_correct_answers_failed)
        
        insert.specifyValue(columnName: PQuiz.ColumnName.show_answer_explanations.rawValue,         columnValue: quizobject.show_answer_explanations)
        insert.specifyValue(columnName: PQuiz.ColumnName.save_and_resume.rawValue,                  columnValue: quizobject.save_and_resume)
        insert.specifyValue(columnName: PQuiz.ColumnName.instructions.rawValue,                     columnValue: quizobject.instructions)
        insert.specifyValue(columnName: PQuiz.ColumnName.mode.rawValue,                             columnValue: quizobject.mode)
        insert.specifyValue(columnName: PQuiz.ColumnName.created_by.rawValue,                       columnValue: quizobject.created_by)
        
        insert.specifyValue(columnName: PQuiz.ColumnName.created_on.rawValue,                       columnValue: quizobject.created_on)
        insert.specifyValue(columnName: PQuiz.ColumnName.updated_by.rawValue,                       columnValue: quizobject.updated_by)
        insert.specifyValue(columnName: PQuiz.ColumnName.updated_on.rawValue,                       columnValue: quizobject.updated_on)
        
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
