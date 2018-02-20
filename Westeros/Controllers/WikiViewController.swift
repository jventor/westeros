//
//  WikiViewController.swift
//  Westeros
//
//  Created by Jaime Ventor on 15/2/18.
//  Copyright © 2018 Jaime Ventor. All rights reserved.
//

import UIKit
import WebKit

class WikiViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    // MARK: - Properties
    var model: House
    
    // MARK: - Initialization
    init (model: House) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    // chapuza
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        syncModelWithView()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(houseDidChange(notification:)), name: NSNotification.Name(rawValue: HOUSE_DID_CHANGE_NOTIFICATION_NAME), object: nil)
    }
    
    @objc func houseDidChange(notification: Notification){
        if let userInfo = notification.userInfo {
            model = userInfo[HOUSE_KEY] as! House
            syncModelWithView()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    // MARK: - Sync
    func syncModelWithView(){
        title = model.name
        webView.load (URLRequest(url: model.wikiURL))
    }
    
}

extension WikiViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction,
                 decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        let type = navigationAction.navigationType
        switch type{
            
        case .linkActivated, .formSubmitted:
            decisionHandler(.cancel)
        default:
            decisionHandler(.allow)
        }
    }
}









