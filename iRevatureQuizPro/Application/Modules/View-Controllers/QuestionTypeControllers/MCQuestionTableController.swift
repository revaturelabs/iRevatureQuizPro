//
//  MultipleChoiceQuestionTableController.swift
//  iRevatureQuizPro
//
//  Created by Kyle Keck on 3/17/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit

class MCQuestionTableController: UITableViewController {
    
    private var answers = [TakeQuizAnswer]()
    
    var currentQuestion: Int = 0
    
    func setAnswers(answers: [TakeQuizAnswer]) {
        self.answers = answers
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.answers.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MCQuestionCell", for: indexPath) as! MCQuestionTableCell
        let unfilteredAnswers = answers[indexPath.row].answer
        var filteredAnswers = unfilteredAnswers.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
        filteredAnswers = filteredAnswers.replacingOccurrences(of: "&quot;", with: "", options: .regularExpression, range: nil)
        filteredAnswers = filteredAnswers.replacingOccurrences(of: "&lt;", with: "", options: .regularExpression, range: nil)
        filteredAnswers = filteredAnswers.replacingOccurrences(of: "&gt;", with: "", options: .regularExpression, range: nil)
        filteredAnswers = filteredAnswers.replacingOccurrences(of: "&#39;", with: "", options: .regularExpression, range: nil)
        
        cell.answerText.text = filteredAnswers
        
        if answers[indexPath.row].isSelected {
            cell.backgroundColor = UIColor.green
        }
        
        
        
        //set background color for cell if it is selected
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.revatureOrange
        cell.selectedBackgroundView = backgroundView
        
        return cell
    }
    
    //user touch event on cell
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let oldCell = tableView.cellForRow(at: AttendeeQuizService.quizQuestions[currentQuestion].chosenAnswer) as? MCQuestionTableCell {
            oldCell.isSelected = false
        }
        
        AttendeeQuizService.quizQuestions[currentQuestion].chosenAnswer.row = indexPath.row
    }
    
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == AttendeeQuizService.quizQuestions[currentQuestion].chosenAnswer.row {
            cell.isSelected = true
        }
    }
    
}
