//
//  HelpViewController.swift
//  iRevatureQuizPro
//
//  Created by Wesley Otero on 3/13/20.
//  Copyright © 2020 revature. All rights reserved.
//

import WebKit

class HelpViewController : BaseViewController, WKNavigationDelegate{
    
    var webView: WKWebView!
    var backButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchDown)
        button.setTitle("Back", for: .normal)
        return button
    }()
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://www.revature.com/")!
        
        webView.load(URLRequest(url: url))
        
        webView.allowsBackForwardNavigationGestures = true
        
        webView.scrollView.addSubview(backButton)
        myButton()
    }
    
    @objc func backButtonTapped(){
        let nextVC = MainStoryBoardViewController.instantiate(fromAppStoryboard: AppStoryboard.Main)
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC,animated: false, completion: nil)
    }
    
    func myButton() {

    backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    backButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    backButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
    backButton.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
    }
}
