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

    var questions:[QuestionObject] = []

    func parseAPI() -> [QuestionObject]{
        

        
        QuestionAPIAccess.getAllQuestions(size: 10, page: 1) { (allQuestions, hasError) in
            guard let q = allQuestions else {
                return
            }
            
//            self.questions = q{QuestionObject(id: $0.id, title: $0.title, tags: $0.tags, questionType: $0.questionType)}
            for quest in q {
                self.questions.append(QuestionObject(id: quest.id, title: quest.title, tags: quest.tags, questionType: quest.questionType!))
                debugPrint(quest.title)
            }
            
        }
       
        return self.questions
        
    }
}
