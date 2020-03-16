//
//  AddQuestionsViewController.swift
//  iRevatureQuizPro
//
//  Created by admin on 3/16/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit

class AddQuestionsViewController : BaseViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var questionsPicked: UITextView!
    @IBOutlet weak var questionsTableView: UITableView!
    @IBOutlet weak var selectAllSwitch: UISwitch!
    
    var currentPage: Int = 1
    var questions: [QuestionObject] = []
    var filteredQuestions: [QuestionObject] = []
    var questionCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.getQuestions(page: 1)
        
        self.questionsTableView.delegate = self
        self.questionsTableView.dataSource = self
        self.searchBar.delegate = self
        questionsPicked.text = "QuestionsPicked: 0"
        selectAllSwitch.isOn = false
        //needs to delay grabbing data or it will display empty table
        repopulateTable()
        //
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredQuestions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddQuestionCell", for: indexPath) as! AddQuestionCell
        var question: QuestionObject
        
        //no need to filter if empty anymore
        question = filteredQuestions[indexPath.row]
        //
        
        cell.titleLabel.text = "Title: \(question.title)"
        cell.tagsLabel.text = "Tags: \(question.tags)"
        cell.typeLabel.text = "Question Type: \(question.questionType)"
        cell.addLabel.text = "Add to Quiz"
        cell.addQuestionSwitch.isOn = false
        
        cell.titleLabel.lineBreakMode = .byWordWrapping
        cell.tagsLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        cell.typeLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! AddQuestionCell
        if cell.addQuestionSwitch.isOn == true{
            questionCount += 1
            questionsPicked.text = "Quesions Picked: \(questionCount)"
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
           
           filteredQuestions = searchText.isEmpty ? questions : questions.filter { (Questions: QuestionObject) -> Bool in
               return Questions.tags.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
           }
           
           questionsTableView.reloadData()
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
    
    func getQuestions(page: Int) {
        QuestionAPIAccess.getAllQuestions(size: 10, page: page) { (allQuestions, hasError) in
            guard let q = allQuestions else {
                return
            }
            
            self.questions = q.map{QuestionObject(id: $0.id, title: $0.title, tags: $0.tags, questionType: $0.questionType!)}
            self.questionsTableView.reloadData()
            
        }
    }
    
    func repopulateTable(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            self.filteredQuestions = self.questions
            self.questionsTableView.reloadData()
        }
    }
    
}
