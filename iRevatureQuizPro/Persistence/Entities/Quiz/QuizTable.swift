//
//  MetatagTable.swift
//  iRevatureQuizPro
//
//  Created by Mark Hawkins on 3/5/20.
//  Copyright © 2020 revature. All rights reserved.
//

import EasySQLite

//=====================================
    //Metatag Table information
//=====================================
struct PQuiz : PersistenceTable {
    //Table's name
    internal static let tableName = "quiz"
    
    //Table's Column Names
    enum ColumnName: String {
        case id = "quiz_id"
        case name = "quiz_name"
        case activity_points = "quiz_activity_points"
        case duration = "quiz_duration"
        case max_attempts = "quiz_max_attempts"
        case level_override = "quiz_level_override"
        case slug = "quiz_slug"
        case description = "quiz_description"
        case meta_description = "quiz_meta_description"
        case image_url = "quiz_image_url"
        case pass_percentage = "quiz_pass_percentage"
        case via_slug = "quiz_via_slug"
        case timer = "quiz_timer"
        case shuffle_questions = "quiz_shuffle_questions"
        case shuffle_answers = "quiz_shuffle_answers"
        case display_score_and_result = "quiz_display_score_and_result"
    }
    
    //Table
    static var table: ESLTable {
        var table = ESLTable(tableName: tableName)
        table.addColumn(columnName: ColumnName.id.rawValue, dataType: .INTEGER, constraints: .PRIMARYKEY, .AUTOINCREMENT)
        table.addColumn(columnName: ColumnName.name.rawValue, dataType: .CHAR, constraints: .UNIQUE, .NOTNULL)
        
        return table
    }
}
