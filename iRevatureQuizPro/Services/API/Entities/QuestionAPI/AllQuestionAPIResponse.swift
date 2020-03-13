//
//  QuestionAPIResponse.swift
//  iRevatureQuizPro
//
//  Created by Kyle Keck on 3/11/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

//Stuct to handle json response from api for all questions
struct AllQuestionAPIResponse: Codable {
    var statusCode: Int
    var description: String
    var data: [AllQuestionAPIData]
}
