//
//  QuestionAccess.swift
//  iRevatureQuizPro
//
//  Created by Wesley Otero on 3/12/20.
//  Copyright © 2020 revature. All rights reserved.
//

import os.log

extension PQuestion {
    //=====================================
    //Get All Question Rows
    //=====================================
    static func getAll() -> [PQuestion.QuestionAllData]? {
        let select = getAllStatement()
        return Database.selectRow(withSelectStatement: select, returnStruct: PQuestion.QuestionAllData.self)
    }
    
    //=====================================
    //Get A Single Quiz Row By Database ID
    //=====================================
    static func getBy(id: Int) -> PQuestion.QuestionAllData? {
        let select = getByStatement(id: id)
        guard let result = Database.selectRow(withSelectStatement: select, returnStruct: PQuestion.QuestionAllData.self) else {
            return nil }
        
        return result.first
    }
    
    //=====================================
    //Get A Single Quiz Row By Name
    //=====================================
//    static func getBy(name: String) -> PQuestion.QuestionAllData? {
//        let select = getByStatement(name: name)
//        guard let result = Database.selectRow(withSelectStatement: select, returnStruct: PQuestion.QuestionAllData.self) else {
//            return nil }
//
//        return result.first
//    }
    
    //=====================================
    //Insert A Single Question Row By Object
    //=====================================
    static func insert(questionObject: QuestionObject) -> Bool {
        
        let insert = insertStatement(questionObject: questionObject)
        
        if !Database.insertRow(withInsertStatement: insert) {
            os_log(DatabaseErrorMessage.insert, log: OSLog.default, type: .error, PQuestion.tableName)
            return false
        }
        
        return true
    }
    
    //=====================================
    // Delete a Question Row By ID
    //=====================================
    static func delete(id: Int) -> Bool {
        let delete = deleteByStatement(id: id)
        
        if !Database.deleteRow(withDeleteStatement: delete) {
            os_log(DatabaseErrorMessage.delete, log: OSLog.default, type: .error, PQuestion.tableName)
            return false
        }
        
        return true
    }
    
}
