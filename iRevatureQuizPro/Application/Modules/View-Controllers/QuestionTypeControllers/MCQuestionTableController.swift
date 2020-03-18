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
        
        //set background color for cell if it is selected
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.revatureOrange
        cell.selectedBackgroundView = backgroundView

        return cell
    }
    
    //user touch event on cell
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! MCQuestionTableCell
        answers[indexPath.row].isSelected = true
        print(answers)
    }
    
    //user deselect cell
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! MCQuestionTableCell
        answers[indexPath.row].isSelected = false
        print(answers)
    }
    
}
