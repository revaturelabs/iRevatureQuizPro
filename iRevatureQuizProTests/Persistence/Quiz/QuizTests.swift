//
//  QuizTests.swift
//  iRevatureQuizProTests
//
//  Created by Jeremy Malisse on 3/9/20.
//  Copyright © 2020 revature. All rights reserved.
//

import XCTest
import EasySQLite

@testable import iRevatureQuizPro

class QuizStatementTests : XCTestCase {
    
    let iso_date_1 = "2019-01-18T16:40:35+0000"
    let iso_date_2 = "2019-01-19T18:54:50+0000"

    let dateFormatter = ISO8601DateFormatter()
    var date1 : Date?
    var date2 : Date?
	
	var manager : EntityManager = EntityManager()
    
    var testQuiz : BQuiz?
    
    override func setUp() {

		// ===== persistence below ====== //
        date1 = dateFormatter.date(from: iso_date_1)
        date2 = dateFormatter.date(from: iso_date_2)
        
        testQuiz = BQuiz(id: 3147,
						 title: "1901_Jan07_PE_Week2",
						 categoryId: 17,
						 passPercentage: 70,
						 metaTags: "SQL, JDBC",
						 mode: "P",
						 orgId: 2,
						 version: 1,
						 superParentId: 3147,
						 preSignupFlag: false,
						 dashboardFlag: false,
						 overrideFlag: false,
						 createdBy: 2301,
						 createdOn: "2019-01-18T16:40:35",
						 isActive: true,
						 isStickyEnabled: false,
						 isImageUploaded: false,
						 quizDuration: 6300,
						 isDurationOverridden: false,
						 isPublic: false,
						 updatedTotalRecords: false,
						 displayCorrectAnswerWhenPassed: true,
						 displayCorrectAnswerWhenFailed: true,
						 isReviewEnabled: true,
						 showWhetherCorrect: true,
						 displayScore: true,
						 timerEnable: true,
						 showExplanation: true,
						 shuffleQsn: true,
						 shuffleAns: true,
						 contentType: "My company",
						 iconDeleted: false,
						 enableSaveResume: true,
						 categoryName: "SQL",
						 createdName: "Yuvaraj Damodaran",
						 qsnCount: 84,
						 isChildAvailable: false,
						 totalRecords: 878,
						 levelId: 3,
						 noOfAttempts: 1,
						 metaDescription: "Topics include SQL, JDBC.",
						 modifiedBy: 2301,
						 modifiedOn: "2019-01-19T18:54:50",
						 quizPools: [QuizPoolItem](),
						 activityPoints: 100,
						 isReqForPublish: false,
						 tags: "SQL, JDBC",
						 slug: "1901_Jan07_PE_Week2",
						 description: "Topics include SQL, JDBC.",
						 instructions: "",
						 modifiedName: "Yuvaraj Damodaran")
        XCTAssert(Database.create(table: PQuiz.table))
    }

    override func tearDown() {
        XCTAssert(Database.drop(table: PQuiz.table))
    }
    
    func testInsertRow() {
        XCTAssert(PQuiz.insert(quizobject: testQuiz!))
    }
    
    func testGetByID() {
		PQuiz.insert(quizobject: testQuiz!)
		
		print("should be \(PQuiz.getAll())")
        XCTAssertEqual(PQuiz.getBy(id: 3147)?.quiz_name, "1901_Jan07_PE_Week2")
    }
    
	func testMarksGet() {
		PQuiz.insert(quizobject: testQuiz!)
		
		var select = ESLSelectStatement()
		select.specifyColumn(table: PQuiz.table, columnName: PQuiz.ColumnName.quiz_id.rawValue, asName: PQuiz.ColumnName.quiz_id.rawValue)
		
		struct returnValues: Codable {
			var quiz_id: Int
		}
		
		let `return` = Database.selectRow(withSelectStatement: select, returnStruct: returnValues.self)
		
		XCTAssertEqual(`return`?.first?.quiz_id, 3147)
		
	}
	
    func testDeleteRow() {
        XCTAssert(PQuiz.delete(id: 3147))
    }
    
//    func testGetAll() {
//        PEventAttendee.insert(firstName: "first", lastName: "last", email: "email1@email.com", phoneNumber: 1234567890, major: "Programming", highestEducation: "College", worthAuthority: "US Citizen")
//        PEventAttendee.insert(firstName: "first", lastName: "last", email: "email2@email.com", phoneNumber: 1234567890, major: "Programming", highestEducation: "College", worthAuthority: "US Citizen")
//
//        XCTAssertEqual(PEventAttendee.getAll()?.count, 2)
//    }
    

}
