//  CreateQuestionBody.swift
//  iRevatureQuizPro
//
//  Created by Kyle Keck on 3/13/20.
//  Copyright © 2020 revature. All rights reserved.
//

//import Foundation
//
//struct CreateQuestionBody {
//    var title: String
//    var levelId: Int
//    var categoryId: Int
//    var noOfAttempts: Int
//    var passPercentage: Int
//    var mode: String
//    var preSignupFlag: Bool
//    var dashboardFlag: Bool
//    var overrideFlag: Bool
//    var quizPools: []
//    var isActive: Bool
//    var isStickyEnabled: Bool
//    var isImageUploaded: Bool
//    var quizDuration: Int
//    var isDurationOverridden: Bool
//    var isPublic: Bool
//    var description: String
//    var enableSaveResume: Bool
//    var displayCorrectAnswerWhenPassed: Bool
//    var displayCorrectAnswerWhenFailed: Bool
//    var isReviewEnabled: Bool
//    var showWhetherCorrect: Bool
//    var displayScore: Bool
//    var timerEnable: Bool
//    var showExplanation: Bool
//    var shuffleQsn: Bool
//    var shuffleAns: Bool
//    var iconDeleted: Bool
//    var updatedTotalRecords: Bool
//}
//
//
//struct QuizPoolItem : Codable {
//    var id: Int?
//    var name: String
//    var maxQstnToDisplay: Int
//    var displayOrder: Int
//    var quizPoolQuestions: QuizQuestionPool
//    var isEdittedMaxQsnToDisp: Bool
//}
//struct AThing {
//   var name: "General Questions",
//   var maxQstnToDisplay: 1,
//   var displayOrder: 1,
//   var quizPoolQuestions:
//   var isEdittedMaxQsnToDisp: false
//}
//
//[{
//        "question": {
//            "id": 4811,
//            "title": "Which of the following best describes a program: (Choose the best option)",
//            "tags": "Introduction to Programming, what is programming",
//            "qsnAnswers": [
//                {
//                    "id": 17282,
//                    "answer": "<p>a set of instructions that a computer executes</p>\n",
//
//                    "order": 1,
//                    "correct": true,
//                    "sticky": false
//                },
//                {
//                    "id": 17283,
//                    "answer": "<p>a set of math problems</p>\n",
//                    "explanation": "Incorrect.",
//                    "order": 2,
//                    "correct": false,
//                    "sticky": false
//                },
//                {
//                    "id": 17284,
//                    "answer": "<p>a show that I watch on television</p>\n",
//                    "explanation": "Incorrect.",
//                    "order": 3,
//                    "correct": false,
//                    "sticky": false
//                },
//                {
//                    "id": 17285,
//                    "answer": "<p>none of the others</p>\n",
//                    "explanation": "Incorrect.",
//                    "order": 4,
//                    "correct": false,
//                    "sticky": false
//                }
//            ],
//            "qsnType": {
//                "id": 1,
//                "code": "QT1",
//                "qsnType": "Best Choice"
//            },
//            "validAnswers": true
//        },
//        "dontEvaluate": false
//    }
//],
//
