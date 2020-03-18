//
//  QuestionPageViewController.swift
//  iRevatureQuizPro
//
//  Created by Wesley Otero on 3/17/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit

class QuestionPageViewController: UIPageViewController{
    
    // Current question user is on
    public var questionIndex: Int?
    
    public var masterTimer = LabelTimer()
    
    public var answerIndex: [String : Int] = [:]
    // List of questions
    public var questionList: [TakeQuizQuestion]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        questionList?.append(TakeQuizQuestion(question: "Is this working", answers: [TakeQuizAnswer(answer: "Yes", isCorrect: true, isSelected: false), TakeQuizAnswer(answer: "No", isCorrect: false, isSelected: false)], isAnswered: false))
        
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
        
        content.timerLabel = masterTimer
        
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
        
        // Updates to the current index
        var index = content.questionIndex
        
        content.timerLabel = masterTimer
        // Updates the index
        index += 1
        
        // Checks if it is out of bounds, to then send you back to the begining of the quiz
        if index == questionList?.count{
            return getViewControllerAtIndex(index: 0)
        }
        
        // If not out of bounds give you the next question
        return getViewControllerAtIndex(index: index)
    }
    
    
}
