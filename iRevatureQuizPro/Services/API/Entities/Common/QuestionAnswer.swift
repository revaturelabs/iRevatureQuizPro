//
//  QuestionAnswer.swift
//  iRevatureQuizPro
//
//  Created by Kyle Keck on 3/11/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

//struct for JSON qsnAnswer object
struct QuestionAnswer: Codable  {
    var id:Int
    var answer:String
    var explanation: String?
    var order:Int
    var correct:Bool
    var sticky:Bool
}
