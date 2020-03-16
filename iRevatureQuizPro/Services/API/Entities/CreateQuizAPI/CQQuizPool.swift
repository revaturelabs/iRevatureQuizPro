//
//  CreateQuizPoolItem.swift
//  iRevatureQuizPro
//
//  Created by Kyle Keck on 3/14/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation


//struct for quizPools key on create new quiz body
struct CQQuizPool: Encodable {
        var name: String
        var maxQstnToDisplay: Int
        var displayOrder: Int
        var quizPoolQuestions: [CQQuizPoolQuestion]
        var isEdittedMaxQsnToDisp: Bool
}
