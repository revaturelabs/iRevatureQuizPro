//
//  MetatagAccess.swift
//  iRevatureQuizPro
//
//  Created by Mark Hawkins on 3/5/20.
//  Copyright © 2020 revature. All rights reserved.
//

extension PMetatag {
//=====================================
    //Get All Metatag Rows
//=====================================
    static func getAll() -> [PMetatag.MetatagAllData]? {
        let select = getAllStatement()
        return Database.selectRow(withSelectStatement: select, returnStruct: PMetatag.MetatagAllData.self)
    }
    
//=====================================
    //Get A Single Metatag Row By Database ID
//=====================================
    static func getBy(id: Int) -> PMetatag.MetatagAllData? {
        let select = getByStatement(id: id)
        guard let result = Database.selectRow(withSelectStatement: select, returnStruct: PMetatag.MetatagAllData.self) else {
            return nil }
        
        return result.first
    }
    
//=====================================
    //Get A Single Metatag Row By Name
//=====================================
    static func getBy(name: String) -> PMetatag.MetatagAllData? {
        let select = getByStatement(name: name)
        guard let result = Database.selectRow(withSelectStatement: select, returnStruct: PMetatag.MetatagAllData.self) else {
            return nil }
        
        return result.first
    }
}
