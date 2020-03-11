//
//  QuestionAPIResponse.swift
//  iRevatureQuizPro
//
//  Created by Kyle Keck on 3/11/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

struct QuestionAPIResponse {
    var statusCode: Int
    var description: String
    var data: [QuestionAPIData]
}
