//
//  QuizByIDResult.swift
//  iRevatureQuizPro
//
//  Created by Kyle Keck on 3/14/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

struct APIQuizByIDResults : Codable  {
    var statusCode: Int
    var description: String
    var data: QuizAPIData
}
