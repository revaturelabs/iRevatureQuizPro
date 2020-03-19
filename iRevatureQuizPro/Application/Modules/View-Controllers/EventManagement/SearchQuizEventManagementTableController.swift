//
//  SearchQuizEventManagementTableController.swift
//  iRevatureQuizPro
//
//  Created by Mark Hawkins on 3/19/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit

class SearchQuizEventManagementTableController: BaseViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var quizTable: UITableView!
    
    var createEventController = CreateEventViewController()
    var filterQuizzes = [QuizAPIData]()
    
    var chosenQuiz = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quizTable.dataSource = self
        quizTable.delegate = self
        
        searchBar.delegate = self
        
        filterQuizzes = createEventController.newQuizArray
        quizTable.reloadData()
    }
    
    @IBAction func returnChosenQuiz(_ sender: UIButton) {
        createEventController.quizIDTextField.text = chosenQuiz
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension SearchQuizEventManagementTableController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterQuizzes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchQuizCell", for: indexPath) as! QuizTableViewCell
        cell.quizTitle.text = filterQuizzes[indexPath.row].title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! QuizTableViewCell
        
        if let text = cell.quizTitle.text, text != "" {
            chosenQuiz = text
            return
        }
        
        chosenQuiz = "Loaded"
    }
    
}

extension SearchQuizEventManagementTableController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterQuizzes = searchText.isEmpty ? createEventController.newQuizArray : createEventController.newQuizArray.filter { (quizobject: QuizAPIData) -> Bool in
            return quizobject.categoryName.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        }
        quizTable.reloadData()
    }
}
