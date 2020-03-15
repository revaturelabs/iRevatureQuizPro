//  CreateQuestionBody.swift
//  iRevatureQuizPro
//
//  Created by Kyle Keck on 3/13/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation


//struct for JSON to create new quiz
struct CQBody: Encodable {
    var title: String
    var levelId: Int
    var categoryId: Int
    var noOfAttempts: Int
    var passPercentage: Int
    var mode: String
    var preSignupFlag: Bool
    var dashboardFlag: Bool
    var overrideFlag: Bool
    var quizPools: [CQQuizPool]
    var isActive: Bool
    var isStickyEnabled: Bool
    var isImageUploaded: Bool
    var quizDuration: Int
    var isDurationOverridden: Bool
    var isPublic: Bool
    var description: String
    var enableSaveResume: Bool
    var displayCorrectAnswerWhenPassed: Bool
    var displayCorrectAnswerWhenFailed: Bool
    var isReviewEnabled: Bool
    var showWhetherCorrect: Bool
    var displayScore: Bool
    var timerEnable: Bool
    var showExplanation: Bool
    var shuffleQsn: Bool
    var shuffleAns: Bool
    var iconDeleted: Bool
    var updatedTotalRecords: Bool

}
