//
//  MultipleChoiceQuestionTableController.swift
//  iRevatureQuizPro
//
//  Created by Kyle Keck on 3/17/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit

class MCQuestionTableController: UITableViewController {
    
    private var answers = [QuestionAnswer]()
    
    func setAnswers(answers: [QuestionAnswer]) {
        self.answers = answers
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.answers.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MCQuestionCell", for: indexPath) as! MCQuestionTableCell

        cell.answerText.text = answers[indexPath.row].answer
        
        //set background color for cell if it is selected
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.revatureOrange
        cell.selectedBackgroundView = backgroundView

        return cell
    }
    
    //user touch event on cell
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! MCQuestionTableCell
    }
    
    //user deselect cell
    /*
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! MCQuestionTableCell

    }
    */
}
