//
//  UIViewController+Safari.swift
//  myApp
//
//  Created by Marc Hein on 22.02.19.
//  Copyright © 2019 Marc Hein Webdesign. All rights reserved.
//

import Foundation
import SafariServices

// MARK:- Safari Extension
extension UIViewController: SFSafariViewControllerDelegate {
    func openSafariViewController(url: URL) {
        let safariVC = SFSafariViewController(url: url)
        self.present(safariVC, animated: true, completion: nil)
        safariVC.delegate = self
    }
    
    fileprivate func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
