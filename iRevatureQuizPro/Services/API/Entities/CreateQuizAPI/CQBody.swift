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
    var preSignupFlag = false
    var dashboardFlag = false
    var overrideFlag = false
    var quizPools: [CQQuizPool]
    var isActive = true
    var isStickyEnabled = false
    var isImageUploaded = false
    var quizDuration: Int
    var isDurationOverridden = false
    var isPublic = false
    var description: String
    var enableSaveResume = false
    var displayCorrectAnswerWhenPassed = false
    var displayCorrectAnswerWhenFailed = false
    var isReviewEnabled = false
    var showWhetherCorrect = false
    var displayScore = false
    var timerEnable = true
    var showExplanation = false
    var shuffleQsn = false
    var shuffleAns = false
    var iconDeleted = false
    var updatedTotalRecords = false
}
