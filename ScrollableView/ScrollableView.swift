//
//  ScrollableView.swift
//  ScrollableView
//
//  Created by Sprinthub on 15/02/2020.
//  Copyright © 2020 Sprinthub Mobile. All rights reserved.
//

import UIKit

open class ScrollableView: UIViewController {
    
    public lazy var content: UIView = {
        let contentView = UIView(frame: .zero)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.clipsToBounds = true
        contentView.autoresizingMask = .flexibleWidth
        return contentView
    }()
    
    public func setup() {
        self.embedInScrollView(self.content)
    }
    
    public func embedInScrollView(_ content: UIView) {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.isDirectionalLockEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.clipsToBounds = true
        
//        scrollView.addSubview(content
//        let stackView = UIStackView(frame: .zero)
//        stackView.axis = .vertical
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.clipsToBounds = true
        
        scrollView.addSubview(self.content)
        
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
                   
                self.content.topAnchor.constraint(equalTo: scrollView.topAnchor),
                self.content.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                self.content.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                self.content.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                self.content.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
//                self.content.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
                self.content.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor, constant: 200),
//                    content.centerYAnchor.cont
           ])
            self.content.backgroundColor = .white
            
//            stackView.addArrangedSubview(self.content)
            scrollView.backgroundColor = .none
            scrollView.setNeedsDisplay()
            scrollView.layoutIfNeeded()
       }
    }
    
    public func addView(view: Any) {
        DispatchQueue.main.async {
            self.content.addSubview(view as! UIView)
            self.content.layoutIfNeeded()
            self.content.subviews.last?.layoutIfNeeded()
        }
    }
    
}
