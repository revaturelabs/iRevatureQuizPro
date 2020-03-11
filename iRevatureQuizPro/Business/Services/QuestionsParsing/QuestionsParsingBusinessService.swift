//
//  QuestionsParsing.swift
//  iRevatureQuizPro
//
//  Created by Kjay Shieu on 3/11/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation
import Combine

class QuestionsParsingBusinessService{


    func parseAPI(){
        var questions:[QuestionObject] = []
        QuestionAPIAccess.getAllQuestions(size: 10, page: 1) { (allQuestions, hasError) in
            guard let q = allQuestions else {
                return
            }
            
             let questions = q.map{QuestionObject(id: $0.id, title: $0.title, tags: $0.tags, questionType: $0.questionType)}
            
        }
    }
}
