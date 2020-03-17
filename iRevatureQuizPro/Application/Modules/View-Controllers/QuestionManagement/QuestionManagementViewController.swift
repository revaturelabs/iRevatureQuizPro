//
//  QuestionManagementViewController.swift
//  iRevatureQuizPro
//
//  Created by Kyle Keck on 3/12/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit

class QuestionManagementViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var QuestionTableView: UITableView!
    
    //added search bar outlet
    @IBOutlet weak var questionSearchBar: UISearchBar!
    //
    
    var currentPage: Int = 1
    var questions = [QuestionObject]()
    var filteredQuestions: [QuestionObject] = []
    
    //Loads in the table view, search bar and grabs the data from API
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.getQuestions(page: 1)
        
        self.QuestionTableView.delegate = self
        self.QuestionTableView.dataSource = self
        self.questionSearchBar.delegate = self
        
        //needs to delay grabbing data or it will display empty table
        repopulateTable()
        //
    }
    
    //grabs the last page of data from API and updates the table view
    @IBAction func previousPageButton(_ sender: Any) {
        if currentPage > 1{
            currentPage -= 1
            getQuestions(page: currentPage)
            repopulateTable()
        }else{
            let alert = UIAlertController(title: "At Starting Page", message: "Cannot go further back a page", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Acknowledge", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    //grabs next page of data from API and updates the table view
    @IBAction func nextPageButton(_ sender: Any) {
        currentPage += 1
        getQuestions(page: currentPage)
        repopulateTable()
    }
    
    //new function that will live update filtered data
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredQuestions = searchText.isEmpty ? questions : questions.filter { (Questions: QuestionObject) -> Bool in
            return Questions.tags.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        }
        
        QuestionTableView.reloadData()
    }
    //
    
    //sets the number of table rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredQuestions.count
    }
    
    //small change
    //populates the table view with the question data
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as! QuestionTableViewCell
        var question: QuestionObject
        
        //no need to filter if empty anymore
        question = filteredQuestions[indexPath.row]
        //
        
        cell.TitleLabel.text = "Title: \(question.title)"
        cell.tagLabel.text = "Tags: \(question.tags)"
        cell.questionTypeLabel.text = "Question Type: \(question.questionType)"
        
        cell.TitleLabel.lineBreakMode = .byWordWrapping
        cell.tagLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        cell.questionTypeLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        return cell
    }
    //
    
    //calls the API and creates an array of the questions
    func getQuestions(page: Int) {
        QuestionAPIAccess.getAllQuestions(size: 10, page: page) { (allQuestions, hasError) in
            guard let q = allQuestions else {
                return
            }
            
            self.questions = q.map{QuestionObject(id: $0.id, title: $0.title, tags: $0.tags, qsnAnswers: $0.qsnAnswers ?? [QuestionAnswer](), questionType: $0.questionType!, qsnType: $0.qsnType ?? QuestionType(id: -1, code: "", qsnType: ""), validAnswers: $0.validAnswers)}
            self.QuestionTableView.reloadData()
            
        }
    }
    
    //grabs the data from the stored return of API and repopulates the table
    func repopulateTable(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.75){
            self.filteredQuestions = self.questions
            self.QuestionTableView.reloadData()
        }
    }
}
