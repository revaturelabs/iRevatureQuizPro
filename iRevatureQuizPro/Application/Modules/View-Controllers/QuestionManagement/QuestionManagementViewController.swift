//
//  QuestionManagementViewController.swift
//  iRevatureQuizPro
//
//  Created by Kyle Keck on 3/12/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit

class QuestionManagementViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating {
    
    @IBOutlet weak var QuestionTableView: UITableView!
    
    var questions = [QuestionObject]()
    let searchController = UISearchController(searchResultsController: nil)
    var isSearchBarEmpty: Bool{
        return searchController.searchBar.text?.isEmpty ?? true
    }
    var filteredQuestions: [QuestionObject] = []
    var isFiltering: Bool {
        return searchController.isActive && !isSearchBarEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.getQuestions()
        
        self.QuestionTableView.delegate = self
        self.QuestionTableView.dataSource = self
        
        self.searchController.searchResultsUpdater = self
        self.searchController.obscuresBackgroundDuringPresentation = false
        self.searchController.searchBar.placeholder = "Search Tags"
        QuestionTableView.tableHeaderView = self.searchController.searchBar
        self.navigationItem.searchController = searchController
        self.definesPresentationContext = false
    }
    
    func filterContentForSearchText(_ searchText: String) {
        
        filteredQuestions = questions.filter { (Questions: QuestionObject) -> Bool in
            return Questions.tags.lowercased().contains(searchText.lowercased())
            
        }
        
        QuestionTableView.reloadData()
    }
    
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text!)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredQuestions.count
        }
        return self.questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as! QuestionTableViewCell
        var question: QuestionObject
        if isFiltering{
            question = filteredQuestions[indexPath.row]
        }else{
            question = questions[indexPath.row]
        }
        
        cell.TitleLabel.text = "Title: \(question.title)"
        cell.tagLabel.text = "Tags: \(question.tags)"
        cell.questionTypeLabel.text = "Question Type: \(question.questionType)"
        
        cell.TitleLabel.lineBreakMode = .byWordWrapping
        cell.tagLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        cell.questionTypeLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        return cell
    }
    
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
