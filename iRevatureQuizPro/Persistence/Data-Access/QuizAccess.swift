//
//  QuizAccess.swift
//  iRevatureQuizPro
//
//  Created by Jeremy Malisse on 3/9/20.
//  Copyright © 2020 revature. All rights reserved.
//
import os.log

extension PQuiz {
    //=====================================
        //Get All Quiz Rows
    //=====================================
    static func getAll() -> [PQuiz.QuizAllData]? {
            let select = getAllStatement()
        return Database.selectRow(withSelectStatement: select, returnStruct: PQuiz.QuizAllData.self)
        }
        
    //=====================================
        //Get A Single Quiz Row By Database ID
    //=====================================
    static func getBy(id: Int) -> PQuiz.QuizAllData? {
            let select = getByStatement(id: id)
        guard let result = Database.selectRow(withSelectStatement: select, returnStruct: PQuiz.QuizAllData.self) else {
                return nil }
            
            return result.first
        }
        
    //=====================================
        //Get A Single Quiz Row By Name
    //=====================================
    static func getBy(name: String) -> PQuiz.QuizAllData? {
            let select = getByStatement(name: name)
        guard let result = Database.selectRow(withSelectStatement: select, returnStruct: PQuiz.QuizAllData.self) else {
                return nil }
            
            return result.first
        }
    
    //=====================================
        //Insert A Single Quiz Row By Object
    //=====================================
    static func insert(quizobject: BQuiz) -> Bool {
        
        let insert = insertStatement(quizobject: quizobject)
        
        if !Database.insertRow(withInsertStatement: insert) {
            os_log(DatabaseErrorMessage.insert, log: OSLog.default, type: .error, PQuiz.tableName)
            return false
        }
        
        return true
    }
    
    //=====================================
        // Delete a Quiz Row By ID
    //=====================================
    static func delete(id: Int) -> Bool {
        let delete = deleteByStatement(id: id)
        
        if !Database.deleteRow(withDeleteStatement: delete) {
            os_log(DatabaseErrorMessage.delete, log: OSLog.default, type: .error, PQuiz.tableName)
            return false
        }
        
        return true
    }
	
	
	//=====================================
	// Update a Quiz Row
	//=====================================
	static func update(bquiz: BQuiz) -> Bool {
		let update = updateByStatement(quizobject: bquiz)
		
		if !Database.updateRow(withUpdateStatement: update) {
			os_log(DatabaseErrorMessage.delete, log: OSLog.default, type: .error, PQuiz.tableName)
			return false
		}
		
		return true
	}
    
}
