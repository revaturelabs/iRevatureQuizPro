//
//  QuizObject.swift
//  iRevatureQuizPro
//
//  Created by Jeremy Malisse on 3/9/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

#warning("Still need to refactor this as a class to avoid using a large amount of optionals.")
// Consider using this as a class with a method that constructs the BQuiz struct from two smaller structs -
//		each of which will be filled by the previous API calls in full.
//

// This Business Entity is the in-memory combination of the two separate API calls, AllQuizzes and QuizByID.
/// Everything must be filled in with either the values returned from the API or 0 or "" (empty string). This avoids having to check for unwrapping optionals.
// MARK: This is the Business Entity used for in-memory operations.
struct BQuiz {
	
	//==========================================================//
	//	This section is common between either API call/struct	//
	//==========================================================//
	var id: Int
	var title: String
	var categoryId: Int
	var passPercentage: Int
	var metaTags: String?
	var mode: String
	var orgId: Int
	var version: Int
	var superParentId: Int
	var preSignupFlag: Bool
	var dashboardFlag: Bool
	var overrideFlag: Bool
	var createdBy: Int
	var createdOn: String
	var isActive: Bool
	var isStickyEnabled: Bool
	var isImageUploaded: Bool
	var quizDuration: Int
	var isDurationOverridden: Bool
	var isPublic: Bool
	var updatedTotalRecords: Bool
	var displayCorrectAnswerWhenPassed: Bool
	var displayCorrectAnswerWhenFailed: Bool
	var isReviewEnabled: Bool
	var showWhetherCorrect: Bool
	var displayScore: Bool
	var timerEnable: Bool
	var showExplanation: Bool
	var shuffleQsn: Bool
	var shuffleAns: Bool
	var contentType: String
	var iconDeleted: Bool
	var enableSaveResume: Bool
	var categoryName: String // For filtering with search bar
	var createdName: String
	
	
	//==============================================================//
	//	This section is ONLY found from the GetALL API call/struct	//
	//==============================================================//
	
	var qsnCount: Int
	var isChildAvailable: Bool
	var totalRecords: Int
	
	
	//==============================================================//
	//	This section is ONLY found from the GetByID API call/struct	//
	//==============================================================//
	
	var levelId: Int
	var noOfAttempts: Int
	var metaDescription: String
	var modifiedBy: Int
	var modifiedOn: String
	var quizPools: [QuizPoolItem]
	var activityPoints: Int
	var isReqForPublish: Bool
	var tags: String
	var slug: String
	var description: String
	var instructions: String
	var modifiedName: String

}
