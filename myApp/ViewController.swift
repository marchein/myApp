//
//  ViewController.swift
//  myApp
//
//  Created by Marc Hein on 22.02.19.
//  Copyright © 2019 Marc Hein Webdesign. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    let whatsappUrl = URL(string: "https://web.whatsapp.com/")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    func configureView() {
        setupWebView()
        loadWhatsAppWeb(self)
    }
    
    func setupWebView() {
        webView.allowsBackForwardNavigationGestures = true
        webView.navigationDelegate = self
        let userAgentValue = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.0.3 Safari/605.1.15"
        webView.customUserAgent = userAgentValue
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        guard let requestedUrl = navigationAction.request.url else {
            fatalError("Error URL: \(navigationAction)")
        }
        if (requestedUrl.absoluteString == "about:blank" || requestedUrl.absoluteString == whatsappUrl.absoluteString) {
            decisionHandler(.allow)
        } else {
            openSafariViewController(url: requestedUrl)
            decisionHandler(.cancel)
        }
    }
    
    @IBAction func loadWhatsAppWeb(_ sender: Any) {
        let request = URLRequest(url: whatsappUrl)
        webView.load(request)
    }
    
    // MARK: - Webkit Helper Functions
    func isAllowedHost(host: String) -> Bool {
        if let _ = host.lowercased().range(of: "whatsapp.com") {
            return true
        }
        return false
    }
}

