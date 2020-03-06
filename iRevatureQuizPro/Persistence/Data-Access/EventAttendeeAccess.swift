//
//  EventAttendeeAccess.swift
//  iRevatureQuizPro
//
//  Created by Mark Hawkins on 3/6/20.
//  Copyright © 2020 revature. All rights reserved.
//

extension PEventAttendee {
    
//=====================================
    //Get All Rows
//=====================================
    static func getAll() -> [PEventAttendee.EventAttendeeAllData]? {
        let select = getAllStatement()
        return Database.selectRow(withSelectStatement: select, returnStruct: PEventAttendee.EventAttendeeAllData.self)
    }
    
//=====================================
    //Get A Single Row By Database ID
//=====================================
    static func getBy(id: Int) -> PEventAttendee.EventAttendeeFullNameEmail? {
        let select = getByStatement(id: id)
        guard let result = Database.selectRow(withSelectStatement: select, returnStruct: PEventAttendee.EventAttendeeFullNameEmail.self) else {
            return nil }
        
        return result.first
    }
    
//=====================================
    //Insert Row Into Database
//=====================================
    static func insert(firstName: String, lastName: String, email: String, phoneNumber: Int, major: String, highestEducation: String, worthAuthority: String) -> Bool {
        let insert = insertStatement(firstName: firstName, lastName: lastName, email: email, phoneNumber: phoneNumber, major: major, highestEducation: highestEducation, worthAuthority: worthAuthority)
        
        return Database.insertRow(withInsertStatement: insert)
    }
    
//=====================================
    //Delete Row From Database By ID
//=====================================
    static func delete(id: Int) -> Bool {
        let delete = deleteByStatement(id: id)
        
        return Database.deleteRow(withDeleteStatement: delete)
    }
}
