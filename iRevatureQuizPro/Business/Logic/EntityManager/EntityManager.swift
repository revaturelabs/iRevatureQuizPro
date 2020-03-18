//
//  EntityManager.swift
//  iRevatureQuizPro
//
//  Created by Jeremy Malisse on 3/13/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

class EntityManager {
	private var quizzes : [BQuiz] = [BQuiz]()
	private var questions : [QuestionObject] = [QuestionObject]()
	
	private var tempquizlist : [QuizAPIData] = [QuizAPIData]()
	
	init() {

	}
	
	func getQuizList() -> [BQuiz] {
		return quizzes
	}
	
	func getTempQuizList() -> [QuizAPIData] {
		return tempquizlist
	}
	
	func addQuizToList(quiz: BQuiz) {
		quizzes.append(quiz)
	}
	
	func getQuestionList() -> [QuestionObject] {
		return questions
	}
	
	func addQuestionToLis(question: QuestionObject) {
		questions.append(question)
	}
	
	func assembleBQuizObject(allhalf: BQuizAllHalf, byidhalf: BQuizByIDHalf) -> BQuiz {
		let newQuizItem = BQuiz(
			
			// May need more coalscing operators if items come back nil when not expected - unsure of what options in the API weren't necessary or unfilled (like metaTags)
			// All API parts
			id: allhalf.id,
			title: allhalf.title,
			categoryId: allhalf.categoryId,
			passPercentage: allhalf.passPercentage,
			metaTags: allhalf.metaTags ?? "None provided",
			mode: allhalf.mode,
			orgId: allhalf.orgId,
			version: allhalf.version,
			superParentId: allhalf.superParentId,
			preSignupFlag: allhalf.preSignupFlag,
			dashboardFlag: allhalf.dashboardFlag,
			overrideFlag: allhalf.overrideFlag,
			createdBy: allhalf.createdBy,
			createdOn: allhalf.createdOn,
			isActive: allhalf.isActive,
			isStickyEnabled: allhalf.isStickyEnabled,
			isImageUploaded: allhalf.isImageUploaded,
			quizDuration: allhalf.quizDuration,
			isDurationOverridden: allhalf.isDurationOverridden,
			isPublic: allhalf.isPublic,
			updatedTotalRecords: allhalf.updatedTotalRecords,
			displayCorrectAnswerWhenPassed: allhalf.displayCorrectAnswerWhenPassed,
			displayCorrectAnswerWhenFailed: allhalf.displayCorrectAnswerWhenFailed,
			isReviewEnabled: allhalf.isReviewEnabled,
			showWhetherCorrect: allhalf.showWhetherCorrect,
			displayScore: allhalf.displayScore,
			timerEnable: allhalf.timerEnable,
			showExplanation: allhalf.showExplanation,
			shuffleQsn: allhalf.shuffleQsn,
			shuffleAns: allhalf.shuffleAns,
			contentType: allhalf.contentType,
			iconDeleted: allhalf.iconDeleted,
			enableSaveResume: allhalf.enableSaveResume,
			categoryName: allhalf.categoryName,
			createdName: allhalf.createdName,
			qsnCount: allhalf.qsnCount,
			isChildAvailable: allhalf.isChildAvailable,
			totalRecords: allhalf.totalRecords,
			
			// By ID API Parts
			levelId: byidhalf.levelId,
			noOfAttempts: byidhalf.noOfAttempts,
			metaDescription: byidhalf.metaDescription,
			modifiedBy: byidhalf.modifiedBy,
			modifiedOn: byidhalf.modifiedOn,
			quizPools: byidhalf.quizPools,
			activityPoints: byidhalf.activityPoints,
			isReqForPublish: byidhalf.isReqForPublish,
			tags: byidhalf.tags,
			slug: byidhalf.slug,
			description: byidhalf.description,
			instructions: byidhalf.instructions,
			modifiedName: byidhalf.modifiedName)
		
		return newQuizItem
	}
	
	func loadDataFromAPI() {
		let apicheck = DispatchGroup()
		
		let loaddata = DispatchWorkItem {
			print("Quiz amount = \(self.tempquizlist.count)")
		}
		
		apicheck.enter()
		
		DispatchQueue.main.async {
			QuizAPI.getAllQuizzes(numberOfRecords: 200, finish: {
				response in
				
				for quiz in response {
					if quiz.mode == "P" {
						self.tempquizlist.append(quiz)
					}
				}
				
				apicheck.leave()
			})
		}
		
		
		apicheck.notify(queue: .main, work: loaddata)
	}
	
	func parseToAllHalf(quiz: QuizAPIData) -> BQuizAllHalf {
		let lefthalf = BQuizAllHalf(id: quiz.id,
									title: quiz.title,
									categoryId: quiz.categoryId,
									passPercentage: quiz.passPercentage,
									metaTags: quiz.metaTags ?? "None Provided",
									mode: quiz.mode,
									orgId: quiz.orgId,
									version: quiz.version,
									superParentId: quiz.superParentId,
									preSignupFlag: quiz.preSignupFlag,
									dashboardFlag: quiz.dashboardFlag,
									overrideFlag: quiz.overrideFlag,
									createdBy: quiz.createdBy,
									createdOn: quiz.createdOn ?? "Not provided",
									isActive: quiz.isActive,
									isStickyEnabled: quiz.isStickyEnabled,
									isImageUploaded: quiz.isImageUploaded,
									quizDuration: quiz.quizDuration,
									isDurationOverridden: quiz.isDurationOverridden,
									isPublic: quiz.isPublic,
									updatedTotalRecords: quiz.updatedTotalRecords,
									displayCorrectAnswerWhenPassed: quiz.displayCorrectAnswerWhenPassed,
									displayCorrectAnswerWhenFailed: quiz.displayCorrectAnswerWhenFailed,
									isReviewEnabled: quiz.isReviewEnabled,
									showWhetherCorrect: quiz.showWhetherCorrect,
									displayScore: quiz.displayScore,
									timerEnable: quiz.timerEnable,
									showExplanation: quiz.showExplanation,
									shuffleQsn: quiz.shuffleQsn,
									shuffleAns: quiz.shuffleAns,
									contentType: quiz.contentType,
									iconDeleted: quiz.iconDeleted,
									enableSaveResume: quiz.enableSaveResume,
									categoryName: quiz.categoryName,
									createdName: quiz.createdName,
									qsnCount: quiz.qsnCount ?? -1,
									isChildAvailable: quiz.isChildAvailable ?? false,
									totalRecords: quiz.totalRecords ?? -1)
		return lefthalf
	}
	
	#warning("forced unwrapping - doesn't every QuizAPI item have a quiz pool?")
	func parseToByIDHalf(quiz: QuizAPIData) -> BQuizByIDHalf {
		let righthalf = BQuizByIDHalf(levelId: quiz.levelId ?? -1,
									  noOfAttempts: quiz.noOfAttempts ?? -1,
									  metaDescription: quiz.metaDescription ?? "None provided",
									  modifiedBy: quiz.modifiedBy ?? -1,
									  modifiedOn: quiz.modifiedOn ?? "None provided",
									  quizPools: quiz.quizPools!,
									  activityPoints: quiz.activityPoints ?? -1,
									  isReqForPublish: quiz.isReqForPublish ?? false,
									  tags: quiz.tags ?? "None provided",
									  slug: quiz.slug ?? "None provided",
									  description: quiz.description ?? "None provided",
									  instructions: quiz.instructions ?? "None provided",
									  modifiedName: quiz.modifiedName ?? "None provided")
		
		return righthalf
	}
	//func mergeData(quizapidata: QuizAPIDat)
}

struct BQuizAllHalf {
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
	var qsnCount: Int
	var isChildAvailable: Bool
	var totalRecords: Int
}

struct BQuizByIDHalf {
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
