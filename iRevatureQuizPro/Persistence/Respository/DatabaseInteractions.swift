//
//  DatabaseInteractions.swift
//  iRevatureQuizPro
//
//  Created by Mark Hawkins on 3/5/20.
//  Copyright © 2020 revature. All rights reserved.
//

import EasySQLite
import os.log

class Database {
    private init() {
    }
    
//=====================================
    //Open Database
//=====================================
    static func openDatabase() throws -> ESLDatabaseAccess {
        guard let db = ESLDatabaseAccess.openDatabase(path: DatabaseInfo.filePath, createIfDoesNotExist: true) else {
            os_log(DatabaseErrorMessage.open, log: OSLog.default, type: .error)
            throw EasySQLiteError.OpenDatabase(message: "")
        }
        return db
    }
    
//=====================================
    //Create Table In Database
//=====================================
    static func create(table: ESLTable) -> Bool {
        do {
            let db = try openDatabase()
            try db.createTable(table: table)
            return true
        } catch {
            os_log(DatabaseErrorMessage.create, log: OSLog.default, type: .error, table.getTableName())
            return false
        }
    }
    
//=====================================
    //Create Table In Database
//=====================================
    static func drop(table: ESLTable) -> Bool {
        do {
            let db = try openDatabase()
            try db.dropTable(table: table)
            return true
        } catch {
            os_log(DatabaseErrorMessage.drop, log: OSLog.default, type: .error, table.getTableName())
            return false
        }
    }
    
//=====================================
    //Insert Row Into Database
//=====================================
    static func insertRow(withInsertStatement insert: ESLInsertStatement) -> Bool {
        do {
            let db = try openDatabase()
            try db.insertRow(statement: insert)
            return true
        } catch {
            os_log(DatabaseErrorMessage.insert, log: OSLog.default, type: .error, insert.getTableName())
            return false
        }
    }
    
//=====================================
    //Delete Row From Database
//=====================================
    static func deleteRow(withDeleteStatement delete: ESLDeleteStatement) -> Bool {
        do {
            let db = try openDatabase()
            try db.deleteRow(statement: delete)
            return true
        } catch {
            os_log(DatabaseErrorMessage.delete, log: OSLog.default, type: .error, delete.getTableName())
            return false
        }
    }
    
//=====================================
    //Delete Row From Database
//=====================================
    static func updateRow(withUpdateStatement update: ESLUpdateStatement) -> Bool {
        do {
            let db = try openDatabase()
            try db.updateRow(statement: update)
            return true
        } catch {
            os_log(DatabaseErrorMessage.update, log: OSLog.default, type: .error, update.getTableName())
            return false
        }
    }
    
//=====================================
    //Select Data From Database
//=====================================
    static func selectRow<T: Codable>(withSelectStatement select: ESLSelectStatement, returnStruct: T.Type) -> [T]? {
        do {
            let db = try openDatabase()
            return try db.selectData(returnStruct: returnStruct, statement: select, debugPrint: false)
        } catch {
            os_log(DatabaseErrorMessage.select, log: OSLog.default, type: .error)
            return nil
        }
    }

}
