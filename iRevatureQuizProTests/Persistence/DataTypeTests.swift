//
//  Generic.swift
//  iRevatureQuizProTests
//
//  Created by Mark Hawkins on 3/13/20.
//  Copyright © 2020 revature. All rights reserved.
//

import XCTest
import EasySQLite

@testable import iRevatureQuizPro

class DataTypeTests: XCTestCase {
    
    var db: ESLDatabaseAccess!
    
    var testTable: ESLTable {
        var table = ESLTable(tableName: "test_double")
        table.addColumn(columnName: "column_1", dataType: .INTEGER, constraints: .PRIMARYKEY, .AUTOINCREMENT)
        table.addColumn(columnName: "column_2", dataType: .DOUBLE, constraints: .NOTNULL)
        return table
    }
    
    struct testReturn: Codable {
        var column_1: Int
        var column_2: Double
    }
    
    override func setUp() {
        XCTAssert(Database.create(table: testTable))
    }

    override func tearDown() {
        XCTAssert(Database.drop(table: testTable))
    }
    
    func testInsertRow() {
        var insert = ESLInsertStatement(table: testTable)
        insert.specifyValue(columnName: "column_2", columnValue: 53.87)
        
        XCTAssert(Database.insertRow(withInsertStatement: insert))
    }
    
    func testDeleteRow() {
        var insert = ESLInsertStatement(table: testTable)
        insert.specifyValue(columnName: "column_2", columnValue: 53.87)
        XCTAssert(Database.insertRow(withInsertStatement: insert))
        
        var insert2 = ESLInsertStatement(table: testTable)
        insert2.specifyValue(columnName: "column_2", columnValue: 87.53)
        XCTAssert(Database.insertRow(withInsertStatement: insert2))
        
        var whereS = ESLWhereStatement()
        whereS.addStatement(table: testTable, columnName: "column_1", expression: .EQUALS, columnValue: 1)
        
        var delete = ESLDeleteStatement(table: testTable)
        delete.setWhereStatement(statement: whereS)
        
        XCTAssert(Database.deleteRow(withDeleteStatement: delete))
        
    }
    
    func testGetAll() {
        var insert = ESLInsertStatement(table: testTable)
        insert.specifyValue(columnName: "column_2", columnValue: 53.87)
        XCTAssert(Database.insertRow(withInsertStatement: insert))
        
        var insert2 = ESLInsertStatement(table: testTable)
        insert2.specifyValue(columnName: "column_2", columnValue: 87.53)
        XCTAssert(Database.insertRow(withInsertStatement: insert2))

        var select = ESLSelectStatement()
        select.specifyColumn(table: testTable, columnName: "column_1", asName: "column_1")
        select.specifyColumn(table: testTable, columnName: "column_2", asName: "column_2")
        
        XCTAssertEqual(Database.selectRow(withSelectStatement: select, returnStruct: testReturn.self)?.count, 2)
    }
//
//    func testGetByID() {
//        PEventAttendee.insert(firstName: "first", lastName: "last", email: "email1@email.com", phoneNumber: 1234567890, major: "Programming", highestEducation: "College", worthAuthority: "US Citizen")
//        PEventAttendee.insert(firstName: "first", lastName: "last", email: "email2@email.com", phoneNumber: 1234567890, major: "Programming", highestEducation: "College", worthAuthority: "US Citizen")
//        PEventAttendee.insert(firstName: "first", lastName: "last", email: "email3@email.com", phoneNumber: 1234567890, major: "Programming", highestEducation: "College", worthAuthority: "US Citizen")
//
//        XCTAssertEqual(PEventAttendee.getBy(id: 2)?.email, "email2@email.com")
//    }
    

}

