//
//  QuestionAPIData.swift
//  iRevatureQuizPro
//
//  Created by Kyle Keck on 3/11/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

struct AllQuestionAPIData: Codable  {
    var id: Int
    var title:String
    var levelId: Int
    var tags: String
    var categoryId: Int
    var categoryName:String
    var questionType:String
    var isDeactivated: Bool
    var totalRecords: Int
    var contentType:String
    var updatedTotalRecords: Bool
    var lineNumber: Int
    var validAnswers: Bool
}
