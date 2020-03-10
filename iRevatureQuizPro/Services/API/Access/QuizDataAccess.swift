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

class QuizDataAccess {
    
    static private let endpoint = "https://dev3-ms.revature.com/apigateway/quiz/secure/quizzes"
    
    static func getQuizzes(finish: @escaping (QuizAPIData) -> Void) {
        
        let user = UserInfoBusinessService.getUserInfo()
        guard let token = user?.token else {
            return
        }
        
        let quizBody = QuizBody(size: 10, page: 1, sortOrder: "desc", orderBy: "creaeName", subscribedContent: false, publicContent: false, ownContent: false, isOrdered: false)
        
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
        ).validate().responseDecodable(of: QuizAPIData.self) {
            (response) in
            
            guard let data = response.value else {
                print(response.error?.errorDescription)
                return
            }

            finish(data)
        }
        
        
    }
    
}
