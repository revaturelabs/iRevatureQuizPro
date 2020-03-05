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
struct PMetatag {
    //Table's name
    private static let tableName = "metatag"
    
    //Table's Column Names
    enum ColumnName: String {
        case id = "tag_id"
        case name = "tag_name"
    }
    
    //Table
    static var table: ESLTable {
        var table = ESLTable(tableName: tableName)
        table.addColumn(columnName: ColumnName.id.rawValue, dataType: .INTEGER, constraints: .PRIMARYKEY, .AUTOINCREMENT)
        table.addColumn(columnName: ColumnName.name.rawValue, dataType: .CHAR, constraints: .UNIQUE, .NOTNULL)
        
        return table
    }
}
