//
//  QuestionPool.swift
//  iRevatureQuizPro
//
//  Created by Kyle Keck on 3/13/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation


struct QuizQuestionPool : Codable  {
    var id: Int?
    var question: QuestionPoolItem
    var order: Int?
    var isSticky: Bool?
    var dontEvaluate: Bool
}
