//
//  HelpViewController.swift
//  iRevatureQuizPro
//
//  Created by Wesley Otero on 3/13/20.
//  Copyright © 2020 revature. All rights reserved.
//

import WebKit

class HelpViewController : UIViewController, WKNavigationDelegate{
    
    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://www.hackingwithswift.com")!
        
        webView.load(URLRequest(url: url))
        
        webView.allowsBackForwardNavigationGestures = true
    }
    
}
