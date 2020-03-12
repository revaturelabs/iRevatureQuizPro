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
    
    func testInserQuestionRecord(){
       XCTAssert(PQuestion.insert(questionObject: QuestionObject(id: 1, title: "Test", tags: "TestTag", questionType: "TestType")))
        
    }
 

    
    /*
        ==TearDown==
     */
    
    
    
    override class func tearDown() {
        // Clean Up
    }
    
    override func tearDown() {
        //Clean Up
    }
    
    
}
