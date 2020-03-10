//
//  QuizAPIData.swift
//  iRevatureQuizPro
//
//  Created by A Guest on 3/9/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

struct QuizAPIData: Codable {
    var id: Int
    var title: String
    var category: String
    var metaTags: [String]
    var quizDuration: Int
}

struct QuizBody: Codable{
    var size: Int
    var page: Int
    var sortOrder: String
    var orderBy: String
    var subscribedContent: Bool
    var publicContent: Bool
    var ownContent: Bool
    var isOrdered: Bool
}
