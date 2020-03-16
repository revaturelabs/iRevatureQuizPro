//
//  QuestionPoolItem.swift
//  iRevatureQuizPro
//
//  Created by Kyle Keck on 3/14/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

struct QuestionPoolItem : Codable  {
    var id: Int
    var title: String
    var levelId: Int?
    var points: Int?
    var score: Double?
    var tags: String
    var durationInSec: Int?
    var categoryId: Int?
    var qsnAnswers: [QuestionAnswer]
    var qsnType: QuestionType
    var categoryName: String?
    var isDeactivated: Bool?
    var updatedTotalRecords: Bool?
    var lineNumber: Int?
    var validAnswers: Bool
}
