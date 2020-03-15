//
//  APIQuizResults.swift
//  iRevatureQuizPro
//
//  Created by Kyle Keck on 3/14/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

// API response struct for the AllQuizzes API call
struct APIQuizResults: Codable {
    var statusCode: Int
    var description: String
    var data: [QuizAPIData]
}
