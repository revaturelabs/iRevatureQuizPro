//
//  QuestionByIDAPIData.swift
//  iRevatureQuizPro
//
//  Created by Kyle Keck on 3/11/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

struct QuestionByIDAPIData {
    var id:Int
    var title: String
    var levelId:Int
    var points:Int
    var score:Int
    var tags: String
    var durationInSec:Int
    var categoryId:Int
    var qsnAnswers: [QuestionAnswer]
    var qsnType: QuestionType
    var isDeactivated: Bool
    var contentType: String
    var updatedTotalRecords: Bool
    var lineNumber:Int
    var validAnswers: Bool
}

