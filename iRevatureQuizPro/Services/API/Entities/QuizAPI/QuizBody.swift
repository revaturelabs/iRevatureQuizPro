//
//  QuizBody.swift
//  iRevatureQuizPro
//
//  Created by Kyle Keck on 3/14/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

// Body of the API request
struct QuizBody: Codable {
    // Size is how many records are being requested
    // Needs to be changed somehow to verify all records are received
    var size: Int
    var page: Int
    var sortOrder: String
    var orderBy: String
    var subscribedContent: Bool
    var publicContent: Bool
    var ownContent: Bool
    var isOrdered: Bool
}
