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
    
    func testGetAllQuizzes() {
        let expectation = self.expectation(description: "This worked")
        
        var didPass:Bool = false
        QuizDataAccess.getAllQuizzes(numberOfRecords: 10) { (quizzes) in
            for quiz in quizzes {
                print(quiz.title)
            }
            didPass = true
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: nil)
        XCTAssertTrue(didPass)
        
    }
    
    func testGetQuizByID() {
        let expectation = self.expectation(description: "This worked")
        var didPass:Bool = false
        QuizDataAccess.getQuizById(quizId: "3164") { (quiz) in
            print(quiz.title)
            didPass = true
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: nil)
        XCTAssertTrue(didPass)
    }
    
    //should fail if the title of the CQBody title is not changed
    func testCreateQuiz() {
        let expectation = self.expectation(description: "Created")
        var didPass = false
        
        let cqQuestionAnswers = [
            QuestionAnswer(id: 17282, answer: "<p>a set of instructions that a computer executes</p>\n", explanation: "", order: 1, correct: true, sticky: false),
            QuestionAnswer(id: 17283, answer: "<p>a set of math problems</p>\n", explanation: "Incorrect", order: 2, correct: false, sticky: false),
            QuestionAnswer(id: 17284, answer: "<p>a show that I watch on television</p>\n", explanation: "Incorrect", order: 3, correct: false, sticky: false)
        ]
        
        let cqQuestionType = QuestionType(id: 1, code: "QT1", qsnType: "Best Choice")
        
        let cqQuestionItem = CQQuestionItem(id: 4811, title: "Which of the following best describes a program: (Choose the best option)", tags: "Programming", qsnAnswers: cqQuestionAnswers, qsnType: cqQuestionType, validAnswers: true)
        
        let cqQuizPoolQuestion = CQQuizPoolQuestion(question: cqQuestionItem, dontEvaluate: false)
        
        let cqQuizPool = CQQuizPool(name: "iRevatureQuizPro", maxQstnToDisplay: 1, displayOrder: 1, quizPoolQuestions: [cqQuizPoolQuestion], isEdittedMaxQsnToDisp: false)
        
        //change title to test again
        let quiz = CQBody(title: "iRevatureQuizPro Test", levelId: 3, categoryId: 16, noOfAttempts: 1, passPercentage: 70, mode: "D", preSignupFlag: false, dashboardFlag: false, overrideFlag: false, quizPools: [cqQuizPool], isActive: true, isStickyEnabled: false, isImageUploaded: false, quizDuration: 120, isDurationOverridden: false, isPublic: true, description: "Test", enableSaveResume: false, displayCorrectAnswerWhenPassed: true, displayCorrectAnswerWhenFailed: true, isReviewEnabled: true, showWhetherCorrect: true, displayScore: true, timerEnable: true, showExplanation: true, shuffleQsn: true, shuffleAns: true, iconDeleted: true, updatedTotalRecords: true)
        
        CreateQuizAPI.createNewQuiz(quiz: quiz) { (didCreate) in
            didPass = didCreate
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 20, handler: nil)
        XCTAssertTrue(didPass)
        
    }
    
}
