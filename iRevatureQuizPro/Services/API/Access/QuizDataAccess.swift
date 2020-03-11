//
//  QuizDataAccess.swift
//  iRevatureQuizPro
//
//  Created by A Guest on 3/9/20.
//  Copyright © 2020 revature. All rights reserved.
//

/*
 
 Allows us to pull all quiz data into an API quiz struct that receives it.
 
 These values are meant to be persisted in the databse to then be used in the business layer.
 
 */

import Alamofire
import os.log

// Makes a request to API to gather all Quizzes Data needed
class QuizDataAccess {
    
    static private let endpoint = "https://dev3-ms.revature.com/apigateway/quiz/secure/quizzes"
    
    // Sends a request to the API for data
    static func getAllQuizzes(finish: @escaping (APIQuizResults) -> Void) {
        
        let user = UserInfoBusinessService.getUserInfo()
        
        guard let token = user?.token else {
            return
        }
        
        //I'm assuming this is test hard coded data, if not this needs a configurable way of doing it
        let quizBody = QuizBody(size: 800, page: 1, sortOrder: "desc", orderBy: "createdName", subscribedContent: false, publicContent: false, ownContent: false, isOrdered: false)
        
        let header: HTTPHeaders = [
            "Content-Type": "application/json",
            "encryptedToken": token
        ]
        
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
                
                print(response.error?.errorDescription)
                return
            }
            
            finish(data)
        }
        
        
    }
    
    static func getQuizById(quizId: String, finish: @escaping (APIQuizResults) -> Void) {
        
        // Grabs an instance of the user defaults
        let user = UserInfoBusinessService.getUserInfo()
        
        // Grabs the token from an instance of the current user
        guard let token =  user?.token else {
            return
        }
        
        let header = ["Content-Type": "application/json",
                      "encryptedToken": token
        ]
        
        
        
    }
    
}
