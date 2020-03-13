//
//  VIewControllerInstantiator.swift
//  iRevatureTrainingRoomMaintenanceScheduler
//
//  Created by Mark Hawkins on 2/12/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation
import UIKit

//Add Stoyboard Names
enum AppStoryboard: String {
    case Main
    case AttendeeSignUp
    case EmployeeLogin
    case EventManagement
    case QuizManagement
    case StartQuiz
    case Help
}

extension AppStoryboard {
    //Create an instance of UIStoryboard
    var instance : UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    
    //Create an instance of View Controller
    func viewController<T : UIViewController>(viewControllerClass : T.Type) -> T {
        let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID
         
        //Make sure that the view controller is properly instantiated
        guard let controller = instance.instantiateViewController(withIdentifier: storyboardID) as? T else {
            fatalError("ViewController: \(storyboardID), not found in \(self.rawValue).")
        }
        
        return controller
    }
    
    //Set initial view controller
    func initialViewController() -> UIViewController? {
        return instance.instantiateInitialViewController()
    }
}

extension UIViewController {
    //Get the storyboard id of the current view controller
    //This holds to the convention of <ViewControllerClassName>_ID
    class var storyboardID : String {
        return "\(self)_ID"
    }
    
    //Create an instance of view controller
    static func instantiate(fromAppStoryboard appStoryboard: AppStoryboard) -> Self {
        return appStoryboard.viewController(viewControllerClass: self)
    }
}


extension UIViewController {
    func easyPresent(_ viewController: UIViewController, animated: Bool, style: UIModalPresentationStyle) {
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: false)
    }
}
