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
    
    let iso_date_1 = "2019-01-18T16:40:35"
    let iso_date_2 = "2019-01-19T18:54:50"

    let dateFormatter = ISO8601DateFormatter()
    var date1 : Date?
    var date2 : Date?
    
    var testQuiz : BQuiz?
    
    override func setUp() {
        
        date1 = dateFormatter.date(from: iso_date_1)
        date2 = dateFormatter.date(from: iso_date_2)
        
        testQuiz = BQuiz(quiz_id: 3147,
                         quiz_name: "1901_Jan07_PE_Week2",
                         activity_points: 100,
                         duration: 6300,
                         max_attempts: 1,
                         level_override: false,
                         slug: "1901_Jan07_PE_Week2",
                         description: "Topics include SQL, JDBC.",
                         meta_description: "Topics include SQL, JDBC.",
                         image_url: "",
                         pass_percentage: 70,
                         via_slug: "",
                         timer: true,
                         shuffle_questions: true,
                         shuffle_answers: true,
                         display_score_and_result: true,
                         allow_attempt_review: true,
                         show_whether_correct: true,
                         show_correct_answers_passed: true,
                         show_correct_answers_failed: true,
                         show_answer_explanations: true,
                         save_and_resume: true,
                         instructions: "",
                         mode: "P",
                         created_by: "Yuvaraj Damodaran",
                         created_on: date1!,
                         updated_by: "Yuvaraj Damodaran",
                         updated_on: date2!)
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
