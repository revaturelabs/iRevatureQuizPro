//
//  QuizReturnStructs.swift
//  iRevatureQuizPro
//
//  Created by Jeremy Malisse 3/5/2020.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

//=====================================
    //Return Structs for data from Quiz Table
//=====================================
extension PQuiz {
    
//=====================================
    //Hold All Columns From Quiz Table
//=====================================
//    struct QuizAllData : Codable {
//        var quiz_id : Int                           //  => id
//        var quiz_name : String                      // => title
//        var activity_points : Int                   // => activityPoints            *** byID
//        var duration : Int                          // => quizDuration
//        var max_attempts : Int                      // => noOfAttempts              *** byID
//        var level_override : Bool                   // => overrideFlag              *** byID
//        var slug : String                           // => slug                      *** byID
//        var description : String                    //                              *** byID
//        var meta_description : String               // no API correlation
//        var image_url : String                      // no API correlation
//        var pass_percentage : Int                   // => passPercentage
//        var via_slug : String                       // no API correlation
//        var timer : Bool                            // => quizDuration
//        var shuffle_questions : Bool                // => shuffleQsn
//        var shuffle_answers : Bool                  // => shuffleAns
//        var display_score_and_result : Bool         // => displayScore
//        var allow_attempt_review : Bool             // => isReviewEnabled
//        var show_whether_correct : Bool             // => showWhetherCorrect
//        var show_correct_answers_passed : Bool      // => displayCorrectAnswerWhenPassed
//        var show_correct_answers_failed : Bool      // => displayCorrectAnswerWhenFailed
//        var show_answer_explanations : Bool         // => showExplanation
//        var save_and_resume : Bool                  // => enableSaveResume
//        var instructions : String                   // => instructions              *** byID
//        var mode : String                           // => mode
//        var created_by : String                     // => createdName
//        var created_on : Date                       //                              *** byID
//        var updated_by : String                     // => modifiedName              *** byID
//        var updated_on : Date                       // => modifiedOn                *** byID
//    }
			
    struct QuizAllData : Codable {
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
}
