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
    
    static func getQuizzes(finish: @escaping (_ quizCall: QuizAPIData) -> Void) {
        
        let header: HTTPHeaders = [
            "Content-Type": "application/json",
            
        ]
        
        AF.request(endpoint, method: .post, parameters: nil).validate().responseDecodable(of: QuizAPIData.self){
            response in
            guard let tempQuiz = response.value else {
                print("Error")
                return
            }

            finish(tempQuiz)
        }
        
        
    }
    
}
