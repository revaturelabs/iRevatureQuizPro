//
//  QuestionType.swift
//  iRevatureQuizPro
//
//  Created by Kyle Keck on 3/11/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

//struct for JSON qsnType object
struct QuestionType: Codable  {
    var id: Int
    var code: String
    var qsnType: String
}
