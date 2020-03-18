////
////  QuizDataService.swift
////  iRevatureQuizPro
////
////  Created by A Guest on 3/11/20.
//// 	Modified by Jeremy Malisse on 3/12/2020.
////  Copyright © 2020 revature. All rights reserved.
////
//
//import Dispatch
//
//  Created by A Guest on 3/11/20.
// 	Modified by Jeremy Malisse on 3/12/2020.
//  Copyright © 2020 revature. All rights reserved.
//

import Dispatch

//class QuizDataService {
//	
//	static private var quizlist = [QuizAPIData]()
//	static private var categories = [String]()
//	
//	static private var returned : Bool = false
//    
//	static func getQuizData() {
//        
//		// Set up dispatch group
//		let apiqueue = DispatchGroup()
//		
//		// Closure with whatever work you want to be done when the thread finishes
//		let finalizeDispatch = DispatchWorkItem {
//			// in this instance I just want to print the count
//			// to be sure it actually finished retrieving all the quizzes from the api
//			print("Quiz amount = \(quizlist.count)")
//			
//			QuizDataService.updateStatus()
//			
//		}
//		
//		// we tell the dispatch group we gonna start
//		apiqueue.enter()
//		
//		// We enter the following closure to the main thread to be run asynchronously
//		DispatchQueue.main.async {
//			QuizAPI.getAllQuizzes(numberOfRecords: 1200, finish: {
//				response in
//				
//				// only take quizzes in publish mode
//				for quiz in response {
//					if quiz.mode == "P" {
//						quizlist.append(quiz)
//					}
//				}
//				
//				// take all quizzes by copying the array
//				//quizlist = response
//				
//				// at this point INSIDE the completion handler for the API function
//				// we notify the group we are finished
//				apiqueue.leave()
//			})
//		}
//		
//		// One enter and leave have evened out ( 1 to 1 in this example )
//		// We do whatever work item we created earlier
//		apiqueue.notify(queue: .main, work: finalizeDispatch)
//    }
//	
//	
//	static func getQuizDataForID(id: Int, finish: @escaping (QuizAPIData) -> Void) {
//		
//		//QuizAPI.getQuizById(quizId: <#T##Int#>, finish: <#T##(APIQuizByIDResults) -> Void#>)
//	}
//	
//	static func updateStatus() {
//		returned = true
//	}
//	
//	static func fetchAllAPIData() -> [QuizAPIData] {
//		return quizlist
//	}
//}
