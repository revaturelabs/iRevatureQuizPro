//
//  QuestionTest.swift
//  iRevatureQuizProTests
//
//  Created by A Guest on 3/12/20.
//  Copyright © 2020 revature. All rights reserved.
//

import XCTest
import EasySQLite

@testable import iRevatureQuizPro

class QuestionStatementsTest : XCTestCase {
    
    
    /*
        ==SetUp==
     */
    
    
    override class func setUp() {
        // Set Up
        Database.create(table: PQuestion.table)
    }
    
    override func setUp() {
        // Set Up
    }
    
    /*
        ==Tests==
     */
    
    // Test record insertion
    func testInserQuestionRecord(){
       XCTAssertTrue(PQuestion.insert(questionObject: QuestionObject(id: 1, title: "Test", tags: "TestTag", questionType: "TestType")))
        
    }
    
    // Test record update
    func testUpdateQuestionRecord(){
        PQuestion.insert(questionObject: QuestionObject(id: 1, title: "TestUpdate", tags: "TestTagUpdate", questionType: "TestTypeUpdate"))
    }
 

    
    /*
        ==TearDown==
     */
    
    override func tearDown() {
        //Clean Up
        
        
    }
    
    override class func tearDown() {
        // Clean Up
        PQuestion.delete(id: 1)
        Database.drop(table: PQuestion.table)
    }
    
    
    
    
}
