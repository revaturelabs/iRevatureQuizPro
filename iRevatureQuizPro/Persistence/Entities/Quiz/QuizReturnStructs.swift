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
    struct QuizAllData : Codable {
        var quiz_id : Int                           //  => id
        var quiz_name : String                      // => title
        var activity_points : Int? = nil            // => activityPoints            *** byID
        var duration : Int                          // => quizDuration
        var max_attempts : Int                      // => noOfAttempts              *** byID
        var level_override : Bool                   // => overrideFlag              *** byID
        var slug : String                           // => slug                      *** byID
        var description : String? = nil             //                              *** byID
        var meta_description : String? = nil        // no API correlation
        var image_url : String? = nil               // no API correlation
        var pass_percentage : Int                   // => passPercentage
        var via_slug : String? = nil                // no API correlation
        var timer : Int                             // => quizDuration
        var shuffle_questions : Bool                // => shuffleQsn
        var shuffle_answers : Bool                  // => shuffleAns
        var display_score_and_result : Bool         // => displayScore
        var allow_attempt_review : Bool             // => isReviewEnabled
        var show_whether_correct : Bool             // => showWhetherCorrect
        var show_correct_answers_passed : Bool      // => displayCorrectAnswerWhenPassed
        var show_correct_answers_failed : Bool      // => displayCorrectAnswerWhenFailed
        var show_answer_explanations : Bool         // => showExplanation
        var save_and_resume : Bool                  // => enableSaveResume
        var instructions : String? = nil            // => instructions              *** byID
        var mode : String                           // => mode
        var created_by : String                     // => createdName
        var created_on : Date? = nil                //                              *** byID
        var updated_by : String                     // => modifiedName              *** byID
        var updated_on : Date                       // => modifiedOn                *** byID
    }
}
