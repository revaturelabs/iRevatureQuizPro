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
        case id = "id"
		case title = "title"
		case description = "description"
		case metaTags = "metaTags"
		case categoryName = "categoryName"
    }
    
    //Table
    static var table: ESLTable {
        var table = ESLTable(tableName: tableName)
		
		table.addColumn(columnName: PQuiz.ColumnName.id.rawValue, dataType: .INT, constraints: .PRIMARYKEY)
		table.addColumn(columnName: PQuiz.ColumnName.title.rawValue, dataType: .CHAR, constraints: .NOTNULL)
		table.addColumn(columnName: PQuiz.ColumnName.description.rawValue, dataType: .CHAR, constraints: .NOTNULL)
		table.addColumn(columnName: PQuiz.ColumnName.metaTags.rawValue, dataType: .CHAR, constraints: .NOTNULL)
		table.addColumn(columnName: PQuiz.ColumnName.categoryName.rawValue, dataType: .CHAR, constraints: .NOTNULL)
		
        // anything in the API but NOT in the erd can be tossed, and blue diamonds in the ERD are not nullable
        return table
    }
}
