//
//  QuestionByIDAPIResponse.swift
//  iRevatureQuizPro
//
//  Created by Kyle Keck on 3/11/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

//struct to handle json response from api for get question using id
struct QuestionByIDAPIResponse: Codable  {
    var statusCode: Int
    var description: String
    var data: QuestionData
}
