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
    private static func openDatabase() throws -> ESLDatabaseAccess {
        guard let db = ESLDatabaseAccess.openDatabase(path: DatabaseInfo.filePath, createIfDoesNotExist: true) else {
            os_log(DatabaseErrorMessage.open, log: OSLog.default, type: .error)
            throw EasySQLiteError.OpenDatabase(message: "")
        }
        return db
    }
    
//=====================================
    //Create Table In Database
//=====================================
    static func create(table: ESLTable) {
        do {
            let db = try openDatabase()
            try db.createTable(table: table)
        } catch {
            os_log(DatabaseErrorMessage.create, log: OSLog.default, type: .error, table.getTableName())
            return
        }
    }
    
//=====================================
    //Insert Row Into Database
//=====================================
    static func insertRow(withInsertStatement insert: ESLInsertStatement) {
        do {
            let db = try openDatabase()
            try db.insertRow(statement: insert)
        } catch {
            os_log(DatabaseErrorMessage.insert, log: OSLog.default, type: .error, insert.getTableName())
            return
        }
    }
    
//=====================================
    //Delete Row From Database
//=====================================
    static func deleteRow(withDeleteStatement delete: ESLDeleteStatement) {
        do {
            let db = try openDatabase()
            try db.deleteRow(statement: delete)
        } catch {
            os_log(DatabaseErrorMessage.delete, log: OSLog.default, type: .error, delete.getTableName())
            return
        }
    }
    
//=====================================
    //Delete Row From Database
//=====================================
    static func updateRow(withUpdateStatement update: ESLUpdateStatement) {
        do {
            let db = try openDatabase()
            try db.updateRow(statement: update)
        } catch {
            os_log(DatabaseErrorMessage.update, log: OSLog.default, type: .error, update.getTableName())
            return
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
