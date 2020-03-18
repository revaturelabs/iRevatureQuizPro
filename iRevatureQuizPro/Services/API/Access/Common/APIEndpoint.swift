//
//  APIEndpoint.swift
//  iRevatureQuizPro
//
//  Created by Kyle Keck on 3/16/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

struct APIEndpoint {
    //URL for all endpoints
    static private let url = "https://dev3-ms.revature.com/apigateway/"

    //endpoint for trainer and ambassador login
    static var trainerLogin: String {
        get {
            return url + "security/admin/login"
        }
    }
    
    //general endpoint for quiz, needs "/<id>" appended to access quiz by ID
    static var quiz: String {
        get {
            return url + "quiz/secure"
        }
    }
    
    //endpoint to get all quizzes
    static var allQuizzes: String {
        get {
            return quiz + "/quizzes"
        }
    }
    
    //endpoint to get all questions
    static var allQuestions: String {
        get {
            return quiz + "/questions"
        }
    }
    
    //endpoint to get question, needs "id" appended to access question by ID
    static var question: String {
        get {
            return quiz + "/question/"
        }
    }
}
