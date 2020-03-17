//
//  QuestionTable.swift
//  iRevatureQuizPro
//
//  Created by Wesley Otero on 3/12/20.
//  Copyright © 2020 revature. All rights reserved.
//

import EasySQLite

//=====================================
    // Question Table information
//=====================================
struct PQuestion : PersistenceTable {
    //Table's name
    static let tableName = "question"
    
    //Table's Column Names
    enum ColumnName: String {
        case question_id = "question_id"
        case question_name = "question_name"
        case tags = "tags"
        case question_type = "question_type"
        
    }
    
    // Returns a table with column definitions
    static var table: ESLTable {
        var table = ESLTable(tableName: tableName)
        table.addColumn(columnName: ColumnName.question_id.rawValue, dataType: .INTEGER, constraints: .PRIMARYKEY, .AUTOINCREMENT)
        table.addColumn(columnName: ColumnName.question_name.rawValue, dataType: .CHAR, constraints: .NOTNULL)
        table.addColumn(columnName: ColumnName.tags.rawValue, dataType: .CHAR, constraints: .NOTNULL)
        table.addColumn(columnName: ColumnName.question_type.rawValue, dataType: .CHAR, constraints: .NOTNULL)
        
        return table
    }
}
