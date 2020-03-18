//
//  QuizViewViewController.swift
//  iRevatureQuizPro
//
//  Created by A Guest on 3/5/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit

class QuizViewViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
	
	@IBOutlet weak var tableQuizPreviews: UITableView!
	var tempquizlist: [QuizAPIData]?
	var filteredquizlist: [QuizAPIData] = []
	
	var managerdelegate = UIApplication.shared.delegate as! AppDelegate
	var manager: EntityManager?
	
	@IBOutlet weak var tableViewQuizzes: UITableView!
	
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return filteredquizlist.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "quizpreviewcell", for: indexPath) as! QuizItemTableViewCell
		
		var quiztodisplay: QuizAPIData
		
		quiztodisplay = filteredquizlist[indexPath.row]
		
		cell.labelCategoryName.text = quiztodisplay.categoryName
		cell.labelQuizName.text = quiztodisplay.title
		cell.labelQuizTags.text = quiztodisplay.metaTags ?? "None provided."
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		// select the quiz to show here
	}
	
	//new function that will live update filtered data
	func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
		
		print("updated")
		
		filteredquizlist = searchText.isEmpty ? tempquizlist! : tempquizlist!.filter { (quizobject: QuizAPIData) -> Bool in
			return quizobject.categoryName.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
		}
		
//		if(searchText.isEmpty == true) {
//			print("empty. should be copy of base data")
//			filteredquizlist = tempquizlist!
//		}
//		else {
//			filteredquizlist = [QuizAPIData]()
//
//			for quiz in tempquizlist! {
//				if quiz.categoryName.contains(searchText) {
//					filteredquizlist.append(quiz)
//				}
//			}
//		}

		tableQuizPreviews.reloadData()
	}
	
    
    @IBOutlet weak var quizSearchBar: UISearchBar!
    @IBOutlet weak var managementTabBar: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
		manager = managerdelegate.manager
		tempquizlist = manager?.getTempQuizList()
		filteredquizlist = tempquizlist!
		tableViewQuizzes.delegate = self
		tableViewQuizzes.dataSource = self
		quizSearchBar.delegate = self
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
