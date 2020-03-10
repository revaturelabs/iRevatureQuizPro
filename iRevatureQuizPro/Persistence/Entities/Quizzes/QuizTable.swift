//
//  QuizTable.swift
//  iRevatureQuizPro
//
//  Created by Jeremy Malisse on 3/6/20.
//  Copyright © 2020 revature. All rights reserved.
//

import EasySQLite

//=====================================
    // Quiz Table information
//=====================================
struct PQuiz : PersistenceTable {
    //Table's name
    static let tableName = "quiz"
    
    //Table's Column Names
    enum ColumnName: String {
        case quiz_id = "quiz_id"
        case quiz_name = "quiz_name"
        case activity_points = "activity_points"
        case duration = "duration"
        case max_attempts = "max_attempts"
        case level_override = "level_override"
        case slug = "slug"
        case description = "description"
        case meta_description = "meta_description"
        case image_url = "image_url"
        case pass_percentage = "pass_percentage"
        case via_slug = "via_slug"
        case timer = "timer"
        case shuffle_questions = "shuffle_questions"
        case shuffle_answers = "shuffle_answers"
        case display_score_and_result = "display_score_and_result"
        case allow_attempt_review = "allow_attempt_review"
        case show_whether_correct = "show_whether_correct"
        case show_correct_answers_passed = "show_correct_answers_passed"
        case show_correct_answers_failed = "show_correct_answers_failed"
        case show_answer_explanations = "show_answer_explanations"
        case save_and_resume = "save_and_resume"
        case instructions = "instructions"
        case mode = "mode"
        case created_by = "created_by"
        case created_on = "created_on"
        case updated_by = "updated_by"
        case updated_on = "updated_on"
    }
    
    //Table
    static var table: ESLTable {
        var table = ESLTable(tableName: tableName)
        table.addColumn(columnName: ColumnName.quiz_id.rawValue, dataType: .INTEGER, constraints: .PRIMARYKEY, .AUTOINCREMENT)
        table.addColumn(columnName: ColumnName.quiz_name.rawValue, dataType: .CHAR, constraints: .UNIQUE, .NOTNULL)
        table.addColumn(columnName: ColumnName.activity_points.rawValue, dataType: .INT, constraints: .NOTNULL)
        table.addColumn(columnName: ColumnName.duration.rawValue, dataType: .INT, constraints: nil)
        table.addColumn(columnName: ColumnName.max_attempts.rawValue, dataType: .INT, constraints: nil)
        table.addColumn(columnName: ColumnName.level_override.rawValue, dataType: .BOOL, constraints: nil)
        table.addColumn(columnName: ColumnName.slug.rawValue, dataType: .CHAR, constraints: nil)
        table.addColumn(columnName: ColumnName.description.rawValue, dataType: .CHAR, constraints: nil)
        table.addColumn(columnName: ColumnName.meta_description.rawValue, dataType: .CHAR, constraints: nil)
        table.addColumn(columnName: ColumnName.image_url.rawValue, dataType: .CHAR, constraints: nil)
        table.addColumn(columnName: ColumnName.pass_percentage.rawValue, dataType: .INT, constraints: .NOTNULL)
        table.addColumn(columnName: ColumnName.via_slug.rawValue, dataType: .CHAR, constraints: nil)
        table.addColumn(columnName: ColumnName.timer.rawValue, dataType: .BOOL, constraints: nil)
        table.addColumn(columnName: ColumnName.shuffle_questions.rawValue, dataType: .BOOL, constraints: nil)
        table.addColumn(columnName: ColumnName.shuffle_answers.rawValue, dataType: .BOOL, constraints: nil)
        table.addColumn(columnName: ColumnName.display_score_and_result.rawValue, dataType: .BOOL, constraints: nil)
        table.addColumn(columnName: ColumnName.allow_attempt_review.rawValue, dataType: .BOOL, constraints: nil)
        table.addColumn(columnName: ColumnName.show_whether_correct.rawValue, dataType: .BOOL, constraints: nil)
        table.addColumn(columnName: ColumnName.show_correct_answers_passed.rawValue, dataType: .BOOL, constraints: nil)
        table.addColumn(columnName: ColumnName.show_correct_answers_failed.rawValue, dataType: .BOOL, constraints: nil)
        table.addColumn(columnName: ColumnName.show_answer_explanations.rawValue, dataType: .BOOL, constraints: nil)
        table.addColumn(columnName: ColumnName.save_and_resume.rawValue, dataType: .BOOL, constraints: nil)
        table.addColumn(columnName: ColumnName.instructions.rawValue, dataType: .CHAR, constraints: nil)
        table.addColumn(columnName: ColumnName.mode.rawValue, dataType: .CHAR, constraints: .NOTNULL)
        table.addColumn(columnName: ColumnName.created_by.rawValue, dataType: .CHAR, constraints: .NOTNULL)
        table.addColumn(columnName: ColumnName.created_on.rawValue, dataType: .DATE, constraints: .NOTNULL)
        table.addColumn(columnName: ColumnName.updated_by.rawValue, dataType: .CHAR, constraints: nil)
        table.addColumn(columnName: ColumnName.updated_on.rawValue, dataType: .DATE, constraints: nil)
        
        // anything in the API but NOT in the erd can be tossed, and blue diamonds in the ERD are not nullable
        return table
    }
}
