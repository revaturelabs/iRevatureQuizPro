//
//  MetatagTable.swift
//  iRevatureQuizPro
//
//  Created by Mark Hawkins on 3/5/20.
//  Copyright © 2020 revature. All rights reserved.
//

import EasySQLite

struct MetatagTable {
    private static let tableName = "metatag"
    
    private enum ColumnName: String {
        case id = "tag_id"
        case name = "tag_name"
    }
    
    static var table: ESLTable {
        var table = ESLTable(tableName: tableName)
        table.addColumn(columnName: ColumnName.id.rawValue, dataType: .INTEGER, constraints: .AUTOINCREMENT, .UNIQUE, .NOTNULL)
        table.addColumn(columnName: ColumnName.name.rawValue, dataType: .CHAR, constraints: .UNIQUE, .NOTNULL)
        
        return table
    }
}
