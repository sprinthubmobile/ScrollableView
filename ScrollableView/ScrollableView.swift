//
//  ScrollableView.swift
//  ScrollableView
//
//  Created by Sprinthub on 15/02/2020.
//  Copyright © 2020 Sprinthub Mobile. All rights reserved.
//

import UIKit

class ScrollableView: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func embedInScrollView(_ content: UIView) {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.isDirectionalLockEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.clipsToBounds = true
        
        scrollView.addSubview(content)
        
        self.view.addSubview(scrollView)
        self.view.backgroundColor = .none

        DispatchQueue.main.async {
           NSLayoutConstraint.activate([
                scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
                scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
                scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
                scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
                scrollView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                scrollView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
                   
                content.topAnchor.constraint(equalTo: scrollView.topAnchor),
                content.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                content.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                content.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                content.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
//                    content.centerYAnchor.cont
           ])
            scrollView.backgroundColor = .none
            scrollView.setNeedsDisplay()
            scrollView.layoutIfNeeded()
       }
    }
    
}