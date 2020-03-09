//
//  QuizObject.swift
//  iRevatureQuizPro
//
//  Created by Jeremy Malisse on 3/9/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

// Business Structs required for persistence layer object conversion.
/// GetByID and GetAll APIs each include some of the info needed to create a full Quiz object for persistence. Using both of these structs and inflating them with the two separate API calls will allow you to create a single entity capable of storing all the necessary information.
// MARK: Cross reference with PQuiz.QuizAllData struct
struct BQuizAllInfo {
    var quiz_id : Int
    var quiz_name : String
    var duration : Int
    var meta_description : String
    var image_url : String
    var pass_percentage : Int
    var via_slug : String
    var timer : Int
    var shuffle_questions : Bool
    var shuffle_answers : Bool
    var display_score_and_result : Bool
    var allow_attempt_review : Bool
    var show_whether_correct : Bool
    var show_correct_answers_passed : Bool
    var show_correct_answers_failed : Bool
    var show_answer_explanations : Bool
    var save_and_resume : Bool
    var mode : String
    var created_by : String
}

struct BQuizByIDInfo {
    var activity_points : Int
    var max_attempts : Int
    var level_override : Bool
    var slug : String
    var description : String
    var instructions : String
    var created_on : Date
    var updated_by : String
    var updated_on : Date
}
