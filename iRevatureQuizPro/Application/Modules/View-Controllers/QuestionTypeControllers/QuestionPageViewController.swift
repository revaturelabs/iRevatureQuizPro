//
//  QuestionPageViewController.swift
//  iRevatureQuizPro
//
//  Created by Wesley Otero on 3/17/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit

class QuestionPageViewController: UIPageViewController{
    
    public var masterTimer = LabelTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource = self
        
//        AttendeeQuizService.fetchCurrentQuiz(quizId: 4217)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5){
        
            self.setViewControllers([self.getViewControllerAtIndex(index: 0)] as [UIViewController], direction: UIPageViewController.NavigationDirection.forward, animated: false, completion: nil)
        }
    }

    
    // Grabs a reference to the MultChoiceVC and updates the question it currently displays
    func getViewControllerAtIndex(index: NSInteger) -> MultipleChoiceQuestionViewController
    {
        // Create a new view controller and pass suitable data.
        let pageContentViewController = self.storyboard?.instantiateViewController(withIdentifier: "MultipleChoice") as! MultipleChoiceQuestionViewController
        
        // Updates the question in the MultChoice View controller
        pageContentViewController.question = AttendeeQuizService.quizQuestions[index].question
        
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
        var pageIndex = content.questionIndex
        
        content.timerLabel = masterTimer
        
        // Checks if the current index is valid
        if pageIndex == 0 || pageIndex == NSNotFound {
            
            return getViewControllerAtIndex(index: AttendeeQuizService.quizQuestions.count - 1)
            
        }
        
        // Updates the index of one minus the current index to go back
        pageIndex -= 1
        
        return getViewControllerAtIndex(index: pageIndex)
        
    }
    
    // Next Question
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        // Instance of the storyboard that is going to be displayed
        let content: MultipleChoiceQuestionViewController = viewController as! MultipleChoiceQuestionViewController
        
        
        // Updates to the current index
        var pageIndex = content.questionIndex
        
        content.timerLabel = masterTimer
        // Updates the index
        pageIndex += 1
        
        // Checks if it is out of bounds, to then send you back to the begining of the quiz
        if pageIndex == AttendeeQuizService.quizQuestions.count {
            return getViewControllerAtIndex(index: 0)
        }
        
        // If not out of bounds give you the next question
        return getViewControllerAtIndex(index: pageIndex)
    }
    
    
}
