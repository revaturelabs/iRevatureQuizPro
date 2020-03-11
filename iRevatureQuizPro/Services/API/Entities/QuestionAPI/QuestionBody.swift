//
//  QuestionBody.swift
//  iRevatureQuizPro
//
//  Created by Kyle Keck on 3/11/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

struct QuestionBody: Codable  {
    var size: Int
    var page: Int
    var sortOrder: String
    var orderBy: String
    var ownedContent: Bool
    var isOrdered: Bool
}
