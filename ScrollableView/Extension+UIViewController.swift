//
//  Extension+UIViewController.swift
//  ScrollableView
//
//  Created by Sprinthub on 15/02/2020.
//  Copyright © 2020 Sprinthub Mobile. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func wrapInNavigation() -> UINavigationController {
        return UINavigationController(rootViewController: self)
    }
    
    func hideKeyboardOnTapAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.hideKeyboard))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func hideKeyboard() {
        self.view.endEditing(true)
    }
}
