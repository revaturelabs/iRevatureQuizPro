//
//  QuestionManagementViewController.swift
//  iRevatureQuizPro
//
//  Created by Kyle Keck on 3/12/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit

class QuestionManagementViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var QuestionTableView: UITableView!
    
    var questions = [QuestionObject]()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.getQuestions()
        
        self.QuestionTableView.delegate = self
        self.QuestionTableView.dataSource = self
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+5) {
//            self.QuestionTableView.reloadData()
//        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as! QuestionTableViewCell
        let question = questions[indexPath.row]
        
        cell.TitleLabel.text = question.title
        cell.tagLabel.text = question.tags
        cell.questionTypeLabel.text = question.questionType
        
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
