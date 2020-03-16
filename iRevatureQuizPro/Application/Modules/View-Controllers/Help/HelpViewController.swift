//
//  HelpViewController.swift
//  iRevatureQuizPro
//
//  Created by Wesley Otero on 3/13/20.
//  Copyright © 2020 revature. All rights reserved.
//
/*
    Allows the user to explore the revature website
*/

import WebKit

class HelpViewController : BaseViewController, WKNavigationDelegate{
    
    var webView: WKWebView!
    
    // Setup for loading the WKWeb View
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // URL that the webview will display
        let url = URL(string: "https://www.revature.com/")!
        
        //Assigns the URL to the webview
        webView.load(URLRequest(url: url))
        
        webView.allowsBackForwardNavigationGestures = true
    }
    
}
