//
//  QuizDataService.swift
//  iRevatureQuizPro
//
//  Created by A Guest on 3/11/20.
//  Copyright © 2020 revature. All rights reserved.
//

class QuizDataService {
    
    func getQuizData(){
        // Do any additional setup after loading the view.
        var sampleQuiz: QuizAPIData
        
        var data = QuizDataAccess.getQuizzes { sampleQuiz in
            
            let quiz = sampleQuiz
            
        }
        
        print(data)
    }
    
}
