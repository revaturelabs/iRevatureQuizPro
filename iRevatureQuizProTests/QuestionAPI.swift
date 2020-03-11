//
//  QuestionAPI.swift
//  iRevatureQuizProTests
//
//  Created by Kyle Keck on 3/11/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation
import XCTest

@testable import iRevatureQuizPro

class QuestionAPITest: XCTestCase {
    
    override func setUp() {
        
    }
    
    override func tearDown() {
        
    }
    
    func testClassAPIRetrieval() {
        let expectation = self.expectation(description: "This worked")
        
        var didPass:Bool = false
        QuestionAPIAccess.getAllQuestions(size: 20, page: 1) { (allQuestions, failure) in
            if failure! {
                print("failed")
            } else {
                if let questions = allQuestions {
                    for question in questions {
                        print(question.id)
                    }
                    didPass = true
                    expectation.fulfill()
                }
            }
        }
        
        waitForExpectations(timeout: 10, handler: nil)
        XCTAssertTrue(didPass)
        
    }
    
    func testQuestionbyidapi() {
        let expectation = self.expectation(description: "This worked")
        
        var didPass:Bool = false
        QuestionAPIAccess.getQuestionByID(id:4217) { (question, failure) in
            if failure! {
                print("failed")
            } else {
                if let q = question {
                    print("---QUESTION TITLE---")
                    print(q.title)
                    didPass = true
                    expectation.fulfill()
                }
            }
        }
        
        waitForExpectations(timeout: 10, handler: nil)
        XCTAssertTrue(didPass)
        
    }
    
    func testQuestionParse() {
        let expectation = self.expectation(description: "wait for API")
        let qpbs = QuestionsParsingBusinessService()
        let questions = qpbs.parseAPI()

        
        waitForExpectations(timeout: 10, handler: nil)
        debugPrint(questions)
        XCTAssertEqual(1, questions.count)
    }
    
}
