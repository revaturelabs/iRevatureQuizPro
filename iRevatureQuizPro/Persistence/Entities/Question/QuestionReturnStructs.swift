//
//  QuestionReturnStructs.swift
//  iRevatureQuizPro
//
//  Created by Wesley Otero on 3/12/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

//=====================================
    //Return Structs for data from Questions Table
//=====================================

extension PQuestion {
    
//=====================================
    //Hold All Columns From Question Table
//=====================================
    struct QuestionAllData : Codable {
        var question_id : Int
        var question_name : String
        var tags : String
        var question_type: String
    }
}
