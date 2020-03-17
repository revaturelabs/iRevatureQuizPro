//
//  QuestionPageViewController.swift
//  iRevatureQuizPro
//
//  Created by Wesley Otero on 3/17/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit

//Temporary struct, represents what the question should need to be displayed
public struct Quiz {
    var title: String
    var questions: [String]
    var duration: Int
}

public struct Question{
    var question: String
    var answers: [String]
//    var isAnswered: Bool
//    var numCorrect: Int
//    var correctAnswer: Int
//
//    var totalQuestionsAnswered: Float
}

public struct Answer {
    var answer: String
    var isCorrect: Bool
    var isSelected: Bool
}


class QuestionPageViewController: UIPageViewController{
    
    // Current question user is on
    public var questionIndex: Int?
    public var answerIndex: [String : Int] = [:]
    // List of questions
    public var questionList: [Question]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionList?.append(Question(question: "Hello World?", answers: ["True","False"]))
        
        questionList?.append(Question(question: "Second Question?", answers: ["True","False"]))
            
        self.dataSource = self
        
        self.setViewControllers([getViewControllerAtIndex(index: questionIndex ?? 0)] as [UIViewController], direction: UIPageViewController.NavigationDirection.forward, animated: false, completion: nil)
    }
    
    // Grabs a reference to the MultChoiceVC and updates the question it currently displays
    func getViewControllerAtIndex(index: NSInteger) -> MultipleChoiceQuestionViewController
    {
        
        // Create a new view controller and pass suitable data.
        let pageContentViewController = self.storyboard?.instantiateViewController(withIdentifier: "MultipleChoice") as! MultipleChoiceQuestionViewController
        
        //This is where the API call should be right now is inflated by an array
        
        // Updates the question in the MultChoice View controller
        pageContentViewController.question = questionList?[index]
        
        // Updates the current index
        pageContentViewController.questionIndex = index
        
        return pageContentViewController
        
    }
    
}

// Allows the user to traverse from one question to the next
extension QuestionPageViewController: UIPageViewControllerDataSource {
    
    // Previous Question
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        // Instance of the storyboard that is going to be displayed
        let content: MultipleChoiceQuestionViewController = viewController as! MultipleChoiceQuestionViewController
        
        // Index for the current content
        var index = content.questionIndex
        
        // Checks if the current index is valid
        if index == 0 || index == NSNotFound {
            
            return getViewControllerAtIndex(index: questionList!.count - 1)
            
        }
        
        // Updates the index of one minus the current index to go back
        index -= 1
        
        return getViewControllerAtIndex(index: index)
        
    }
    
    // Next Question
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        // Instance of the storyboard that is going to be displayed
        let content: MultipleChoiceQuestionViewController = viewController as! MultipleChoiceQuestionViewController
        
        var index = content.questionIndex
        
        
        index += 1
        
        if index == questionList?.count{
            return getViewControllerAtIndex(index: 0)
        }
        
        
        return getViewControllerAtIndex(index: index)
    }
    
    
}
