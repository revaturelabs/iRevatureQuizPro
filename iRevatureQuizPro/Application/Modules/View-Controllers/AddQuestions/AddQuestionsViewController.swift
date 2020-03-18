//
//  AddQuestionsViewController.swift
//  iRevatureQuizPro
//
//  Created by admin on 3/16/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit

//Class that controls the AddQuestions view
class AddQuestionsViewController : BaseViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var questionsPicked: UITextView!
    @IBOutlet weak var questionsTableView: UITableView!
    @IBOutlet weak var selectAllSwitch: UISwitch!
    
    var quiz: QuizWrapper?
    
    var currentPage: Int = 1
    var questions: [QuestionObject] = []
    var filteredQuestions: [QuestionObject] = []
    
    var selectedQuestionCountText = "Questions Picked: "
    var selectedQuestion: [QuestionObject] = []
    var selectedRow: Int = -1
    
    //Creates the tableview, search bar and calls API
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.getQuestions(page: 1)
        
        self.questionsTableView.delegate = self
        self.questionsTableView.dataSource = self
        self.searchBar.delegate = self
        //needs to delay grabbing data or it will display empty table
        //repopulateTable()
        //
    }
    
    //returns user to the create quiz view
    @IBAction func backButton(_ sender: Any) {
        let nextVC = CreateQuizViewController.instantiate(fromAppStoryboard: AppStoryboard.QuizManagement)
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: false, completion: nil)
    }
    
    //not used but in might be in later updates
    @IBAction func moreOptions(_ sender: Any) {
    }
    
    //adds single selected question to quiz
    @IBAction func postDraftButton (_ sender: Any) {
        //selectedQuestion is the end array
        for q in selectedQuestion {
            quiz!.add(question: q)
        }
        
        quiz?.quizData.mode = "D"
        
        CreateQuizAPI.createNewQuiz(quiz: quiz!.toAPIFormat, completionHandler: {(leBool) in
            self.dismiss(animated: true, completion: nil)
        })
    }
    
    //will persist the questions selected and create the quiz
    @IBAction func postPublishButton(_ sender: Any) {
        //selectedQuestion is the end array
        for q in selectedQuestion {
            quiz!.add(question: q)
        }
        
        quiz?.quizData.mode = "P"
        
        CreateQuizAPI.createNewQuiz(quiz: quiz!.toAPIFormat, completionHandler: {(leBool) in
            self.dismiss(animated: true, completion: nil)
        })
    }
    
    //removes all questions from array
    @IBAction func removeAllButton(_ sender: Any) {
        let alert = UIAlertController(title: "Removing All Questions", message: "Are you sure you want to do this?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {action in
            self.selectedQuestion.removeAll()
            self.questionsPicked.text = self.selectedQuestionCountText + String(self.selectedQuestion.count)
            
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    //adds all currentlt displayed questions to quiz
    @IBAction func addAllButton(_ sender: Any) {
        for index in 0...9{
            add(question: filteredQuestions[index])
        }
        
        questionsPicked.text = selectedQuestionCountText + String(selectedQuestion.count)
    }
    
    //displays the next page in questions from API call
    @IBAction func lastPageButton(_ sender: Any) {
        if currentPage > 1{
            currentPage -= 1
            getQuestions(page: currentPage)
            //repopulateTable()
        }else{
            let alert = UIAlertController(title: "At Starting Page", message: "Cannot go further back a page", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Acknowledge", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    //displays the last page in questions from API call
    @IBAction func nextPageButton(_ sender: Any) {
        currentPage += 1
        getQuestions(page: currentPage)
        //repopulateTable()
    }
}

extension AddQuestionsViewController: UITableViewDataSource, UITableViewDelegate {
    //detects the row that is selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //selectedRow = indexPath.row
        add(question: filteredQuestions[indexPath.row])
        questionsPicked.text = selectedQuestionCountText + String(selectedQuestion.count)
    }
    
    //determines the number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredQuestions.count
    }
    
    //populates the table view with data from API
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddQuestionCell", for: indexPath) as! AddQuestionCell
        var question: QuestionObject
        
        //no need to filter if empty anymore
        question = filteredQuestions[indexPath.row]
        
        cell.titleLabel.text = "Title: \(question.title)"
        cell.tagsLabel.text = "Tags: \(question.tags)"
        cell.typeLabel.text = "Question Type: \(question.questionType)"
        

        cell.titleLabel.lineBreakMode = .byWordWrapping
        cell.tagsLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        cell.typeLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        return cell
    }
}


extension AddQuestionsViewController: UISearchBarDelegate {
    //live filters the tableview for specified tag
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredQuestions = searchText.isEmpty ? questions : questions.filter { (Questions: QuestionObject) -> Bool in
            return Questions.tags.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        }
        
        questionsTableView.reloadData()
    }
    
    //API call to grab questions
    func getQuestions(page: Int) {
        QuestionAPIAccess.getAllQuestions(size: 10, page: page) { (allQuestions, hasError) in
            guard let q = allQuestions else {
                return
            }
            
            self.questions = q.map{QuestionObject(id: $0.id, title: $0.title, tags: $0.tags, qsnAnswers: $0.qsnAnswers ?? [QuestionAnswer](), questionType: $0.questionType!, qsnType: $0.qsnType ?? QuestionType(id: -1, code: "", qsnType: ""), validAnswers: $0.validAnswers)}
            self.questionsTableView.reloadData()
            
            self.repopulateTable()
        }
    }
    
    //repopulates the table after short delay for API to catch up
    func repopulateTable(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            self.filteredQuestions = self.questions
            self.questionsTableView.reloadData()
        }
    }
}

extension AddQuestionsViewController {
    func add(question: QuestionObject) {
        for q in self.selectedQuestion {
            if q.id == question.id { return }
        }
        
        self.selectedQuestion.append(question)
    }
}
