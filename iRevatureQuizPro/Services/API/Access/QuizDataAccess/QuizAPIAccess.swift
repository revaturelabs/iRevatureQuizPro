//
//  QuizDataAccess.swift
//  iRevatureQuizPro
//
//  Created by A Guest on 3/9/20.
//	Modified by Jeremy Malisse on 3/11/2020.
//  Copyright © 2020 revature. All rights reserved.
//
import Alamofire
import os.log

// MARK: API was not built for the purpose of this app usage. Therefor, the API data returned does not match the requirements we have designed.
/// To correctly fill all necessary data, a call must be made to the AllQuiz API to obtain all existing quizzes.
/// Then, for each ID contained in that massive list - a call to the ByID API needs to be made.
/// Using both data sources each Quiz Entitity will be constructed from the resulting data.


// Makes a request to API to gather "All Quiz" API Data needed to persist
class QuizAPI {
	
	// Endpoint declarations
	static private let endpoint = "https://dev3-ms.revature.com/apigateway/quiz/secure/quizzes"
	static private let endpointByID = "https://dev3-ms.revature.com/apigateway/quiz/secure/"
	
	// Sends a request to the API for data
	static func getAllQuizzes(numberOfRecords: Int, finish: @escaping ([QuizAPIData]) -> Void) {
		
		let quizBody = QuizBody(size: numberOfRecords, page: 1, sortOrder: "desc", orderBy: "createdName", subscribedContent: false, publicContent: false, ownContent: false, isOrdered: false)
		
		let header = API.getHTTPHeader()
		
		AF.request(
			endpoint,
			method: .post,
			parameters: quizBody,
			encoder: JSONParameterEncoder.default,
			headers: header
		).validate().responseDecodable(of: APIQuizResults.self) {
			(response) in
			
			guard let data = response.value else {
				print(response.debugDescription)
				
				print(response.error.debugDescription)
				
				print(response.error?.errorDescription as Any)
				return
			}
			finish(data.data)
		}
	}
	
	// API call returns a single QuizID object
	static func getQuizById(quizId: Int, finish: @escaping (APIQuizByIDResults) -> Void) {
		
//		let quizData = QuizBody(size: 1, page: 1, sortOrder: "desc", orderBy: "createdName", subscribedContent: false, publicContent: false, ownContent: false, isOrdered: false)
		
		let header = API.getHTTPHeader()
		
		// Append requested ID to ByID endpoint
		let endpointForSingleID = endpointByID + "\(quizId)"
		
		AF.request(
			endpointForSingleID,
//			method: .get,
//			parameters: quizData,
//			encoder: JSONParameterEncoder.default,
			headers: header
		).validate().responseDecodable(of: APIQuizByIDResults.self) {
			(response) in
			
			guard let data = response.value else {
				print(response.debugDescription)
				
				print(response.error.debugDescription)
				
				print(response.error?.errorDescription as Any)
				return
			}
			finish(data)
		}
	}
}
