//
//  AddQuestionsViewController.swift
//  iRevatureQuizPro
//
//  Created by admin on 3/16/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit

class AddQuestionsViewController : BaseViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var questionsPicked: UITextView!
    @IBOutlet weak var questionsTableView: UITableView!
    
    let questionsPickedText = "Questions Picked: "
    var selectedQuestions = [AddQuestionCell]()
    
    var currentPage: Int = 1
    var questions = [QuestionObject]()
    var filteredQuestions: [QuestionObject] = []
    
    override func viewDidLoad() {
        questionsTableView.dataSource = self
        questionsTableView.delegate = self
        searchBar.delegate = self
        
        getQuestions(page: currentPage)
        repopulateTable()
    }
    
    @IBAction func backButton(_ sender: Any) {
        let nextVC = CreateQuizViewController.instantiate(fromAppStoryboard: AppStoryboard.QuizManagement)
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: false, completion: nil)
    }
    
    @IBAction func moreOptions(_ sender: Any) {
    }
    
    @IBAction func submitButton(_ sender: Any) {
    }
    
}

extension AddQuestionsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredQuestions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "addQuestionCell", for: indexPath) as! AddQuestionCell
        let question = filteredQuestions[indexPath.row]
        
        cell.titleLabel.text = "Title: \(question.title)"
        cell.tagsLabel.text = "Tags: \(question.tags)"
        cell.typeLabel.text = "Question Type: \(question.questionType)"
        cell.addQuestionSwitch.setOn(false, animated: false)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 186
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! AddQuestionCell
        cell.addQuestionSwitch.setOn(!cell.addQuestionSwitch.isOn, animated: true)
        
        addRemoveCellFromList(cell: cell)
        
        questionsPicked.text = questionsPickedText + String(selectedQuestions.count)
    }
    
    func addRemoveCellFromList(cell: AddQuestionCell) {
        if cell.addQuestionSwitch.isOn { selectedQuestions.append(cell) }
        else {
            for (index, question) in selectedQuestions.enumerated() {
                if question.titleLabel.text == cell.titleLabel.text {
                    selectedQuestions.remove(at: index)
                    break
                }
            }
        }
    }
    
}

extension AddQuestionsViewController: UISearchBarDelegate {
    //new function that will live update filtered data
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredQuestions = searchText.isEmpty ? questions : questions.filter { (Questions: QuestionObject) -> Bool in
            return Questions.tags.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        }
        
        questionsTableView.reloadData()
    }
    
    //calls the API and creates an array of the questions
    func getQuestions(page: Int) {
        QuestionAPIAccess.getAllQuestions(size: 100, page: page) { (allQuestions, hasError) in
            guard let q = allQuestions else {
                return
            }
            
            self.questions = q.map{QuestionObject(id: $0.id, title: $0.title, tags: $0.tags, qsnAnswers: $0.qsnAnswers ?? [QuestionAnswer](), questionType: $0.questionType!, qsnType: $0.qsnType ?? QuestionType(id: -1, code: "", qsnType: ""), validAnswers: $0.validAnswers)}
            self.questionsTableView.reloadData()
            self.repopulateTable()
        }
    }
    
    //grabs the data from the stored return of API and repopulates the table
    func repopulateTable(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.75){
            self.filteredQuestions = self.questions
            self.questionsTableView.reloadData()
        }
    }
}
