//
//  MetatagReturnStructs.swift
//  iRevatureQuizPro
//
//  Created by Mark Hawkins on 3/5/20.
//  Copyright © 2020 revature. All rights reserved.
//

//=====================================
    //Return Structs for data from Metatag Table
//=====================================
extension PQuiz {
    
//=====================================
    //Hold All Columns From Metatag Table
//=====================================
    struct QuizAllData: Codable {
        var quiz_id : Int
        var quiz_name : String
        var activity_points : Int
        var duration : String
        var max_attempts : Int
        var level_override : Bool
    }
}
