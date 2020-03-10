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

// Business Structs required for persistence layer object conversion.
/// GetByID and GetAll APIs each include some of the info needed to create a full Quiz object for persistence. Using both of these structs and inflating them with the two separate API calls will allow you to create a single entity capable of storing all the necessary information.
// MARK: Cross reference with PQuiz.QuizAllData struct
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

// This Business Entity is the in-memory combination of the two parts required for processing from two separate API calls.
/// This struct is similar to the one used for Persistence operations but is a combination of the two parts that are separately returned from the API calls. There are no optionals in this struct.
/// Everything must be filled in with either the values returned from the API or 0 or "" (empty string). This avoids having to check for unwrapping optionals.
// MARK: This is the Business Entity used for in-memory operations.
struct BQuiz {
    var quiz_id : Int
    var quiz_name : String
    var activity_points : Int           // Will require Ternary Operator to 0 or "" if the returned object is empty
    var duration : Int
    var max_attempts : Int
    var level_override : Bool
    var slug : String
    var description : String            // Will require Ternary Operator to 0 or "" if the returned object is empty
    var meta_description : String       // Will require Ternary Operator to 0 or "" if the returned object is empty
    var image_url : String              // Will require Ternary Operator to 0 or "" if the returned object is empty
    var pass_percentage : Int
    var via_slug : String               // Will require Ternary Operator to 0 or "" if the returned object is empty
    var timer : Bool
    var shuffle_questions : Bool
    var shuffle_answers : Bool
    var display_score_and_result : Bool
    var allow_attempt_review : Bool
    var show_whether_correct : Bool
    var show_correct_answers_passed : Bool
    var show_correct_answers_failed : Bool
    var show_answer_explanations : Bool
    var save_and_resume : Bool
    var instructions : String           // Will require Ternary Operator to 0 or "" if the returned object is empty
    var mode : String
    var created_by : String
    var created_on : Date               // Will require Ternary Operator to 0 or "" if the returned object is empty
    var updated_by : String
    var updated_on : Date
}
