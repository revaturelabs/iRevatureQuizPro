//
//  QuizViewViewController.swift
//  iRevatureQuizPro
//
//  Created by A Guest on 3/5/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit

class QuizViewViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
	
	var tempquizlist : [QuizAPIData]?
	
	var managerdelegate = UIApplication.shared.delegate as! AppDelegate
	var manager : EntityManager?
	
	@IBOutlet weak var tableViewQuizzes: UITableView!
	
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return tempquizlist?.count ?? 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "quizpreviewcell", for: indexPath) as! QuizItemTableViewCell
		
		cell.labelCategoryName.text = tempquizlist![indexPath.row].categoryName
		cell.labelQuizName.text = tempquizlist![indexPath.row].title
		cell.labelQuizTags.text = tempquizlist![indexPath.row].metaTags ?? "None provided."
		
		return cell
		
	}
	
    
    @IBOutlet weak var quizSearchBar: UISearchBar!
    @IBOutlet weak var managementTabBar: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
		manager = managerdelegate.manager
		tempquizlist = manager?.getTempQuizList()
		tableViewQuizzes.delegate = self
		tableViewQuizzes.dataSource = self
		print("controller quiz count: \(tempquizlist!.count)")
    }
    
    @IBAction func createQuizButton(_ sender: Any) {
        let nextVC = CreateQuizViewController.instantiate(fromAppStoryboard: AppStoryboard.QuizManagement)
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: false, completion: nil)
    }
    
    @IBAction func optionsButton(_ sender: Any) {
        let nextVC = EmployeeLoginViewController.instantiate(fromAppStoryboard: AppStoryboard.EmployeeLogin)
               nextVC.modalPresentationStyle = .fullScreen
               present(nextVC, animated: false, completion: nil)
    }
    
}
