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
    
    var questions = [QuestionObject]()
    var filteredQuestions: [QuestionObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.getQuestions()
        
        self.QuestionTableView.delegate = self
        self.QuestionTableView.dataSource = self
        self.questionSearchBar.delegate = self
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.75){
            self.filteredQuestions = self.questions
            self.QuestionTableView.reloadData()
        }
    }
    
    //new function that will live update filtered data
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredQuestions = searchText.isEmpty ? questions : questions.filter { (Questions: QuestionObject) -> Bool in
            return Questions.tags.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        }
        
        QuestionTableView.reloadData()
    }
    //
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredQuestions.count
    }
    
    
    //small change
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
    
    func getQuestions() {
        QuestionAPIAccess.getAllQuestions(size: 10, page: 1) { (allQuestions, hasError) in
            guard let q = allQuestions else {
                return
            }
            
            self.questions = q.map{QuestionObject(id: $0.id, title: $0.title, tags: $0.tags, questionType: $0.questionType)}
            print(self.questions)
            self.QuestionTableView.reloadData()
            
        }
    }
}
