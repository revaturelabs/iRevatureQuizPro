//
//  HelpViewController.swift
//  iRevatureQuizPro
//
//  Created by Wesley Otero on 3/13/20.
//  Copyright © 2020 revature. All rights reserved.
//

import WebKit

//class for a link to the revature website for more information
class HelpViewController : BaseViewController, WKNavigationDelegate{
    
    var webView: WKWebView!
    //create button with parameters in location and color
    var backButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 30, width: 100, height: 44))
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchDown)
        button.setTitle("Back to app", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    // WKWebView setup
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    // Displays revature website when view loads
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://www.revature.com/")!
        
        // Assigns the url to be displaued to the webView
        webView.load(URLRequest(url: url))
        
        webView.addSubview(backButton)
        myButton()
    }
    
    //action to go back to app when in Webview
    @objc func backButtonTapped(){
        let nextVC = MainStoryBoardViewController.instantiate(fromAppStoryboard: AppStoryboard.Main)
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC,animated: false, completion: nil)
    }
    
    //sets constraints to backButton
    func myButton() {

    backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    backButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    backButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 24).isActive = true
    backButton.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
    }
}
