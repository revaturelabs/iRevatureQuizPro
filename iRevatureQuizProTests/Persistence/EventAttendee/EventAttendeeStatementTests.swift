//
//  EventAttendeeStatementTests.swift
//  iRevatureQuizProTests
//
//  Created by Mark Hawkins on 3/6/20.
//  Copyright © 2020 revature. All rights reserved.
//

import XCTest
import EasySQLite

@testable import iRevatureQuizPro

class EventAttendeeStatementTests: XCTestCase {
    
    var db: ESLDatabaseAccess!
    
    override func setUp() {
        XCTAssert(Database.create(table: PEventAttendee.table))
    }

    override func tearDown() {
        XCTAssert(Database.drop(table: PEventAttendee.table))
    }
    
    func testInsertRow() {
        XCTAssert(PEventAttendee.insert(firstName: "first", lastName: "last", email: "email@email.com", phoneNumber: 1234567890, major: "Programming", highestEducation: "College", worthAuthority: "US Citizen"))
    }
    
    func testDeleteRow() {
        PEventAttendee.insert(firstName: "first", lastName: "last", email: "email1@email.com", phoneNumber: 1234567890, major: "Programming", highestEducation: "College", worthAuthority: "US Citizen")
        PEventAttendee.insert(firstName: "first", lastName: "last", email: "email2@email.com", phoneNumber: 1234567890, major: "Programming", highestEducation: "College", worthAuthority: "US Citizen")
        PEventAttendee.insert(firstName: "first", lastName: "last", email: "email3@email.com", phoneNumber: 1234567890, major: "Programming", highestEducation: "College", worthAuthority: "US Citizen")
        
        XCTAssert(PEventAttendee.delete(id: 2))
    }
    
    func testGetAll() {
        PEventAttendee.insert(firstName: "first", lastName: "last", email: "email1@email.com", phoneNumber: 1234567890, major: "Programming", highestEducation: "College", worthAuthority: "US Citizen")
        PEventAttendee.insert(firstName: "first", lastName: "last", email: "email2@email.com", phoneNumber: 1234567890, major: "Programming", highestEducation: "College", worthAuthority: "US Citizen")
        
        XCTAssertEqual(PEventAttendee.getAll()?.count, 2)
    }
    
    func testGetByID() {
        PEventAttendee.insert(firstName: "first", lastName: "last", email: "email1@email.com", phoneNumber: 1234567890, major: "Programming", highestEducation: "College", worthAuthority: "US Citizen")
        PEventAttendee.insert(firstName: "first", lastName: "last", email: "email2@email.com", phoneNumber: 1234567890, major: "Programming", highestEducation: "College", worthAuthority: "US Citizen")
        PEventAttendee.insert(firstName: "first", lastName: "last", email: "email3@email.com", phoneNumber: 1234567890, major: "Programming", highestEducation: "College", worthAuthority: "US Citizen")
        
        XCTAssertNotNil(PEventAttendee.getBy(id: 2))
    }
    

}
