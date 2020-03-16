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
