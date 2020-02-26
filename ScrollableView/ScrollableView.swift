//
//  ScrollableView.swift
//  ScrollableView
//
//  Created by Sprinthub on 15/02/2020.
//  Copyright © 2020 Sprinthub Mobile. All rights reserved.
//

import UIKit

open class ScrollableView: UIViewController {
    
    public lazy var content: UIStackView = {
        let contentView = UIStackView(frame: .zero)
        contentView.axis = .vertical
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.clipsToBounds = true
        contentView.distribution = .fill
//        contentView.autoresizingMask = .flexibleWidth
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
//
//
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
//                self.content.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor, constant: 200),
           ])
            self.content.backgroundColor = .white
            
            scrollView.backgroundColor = .none
            scrollView.setNeedsDisplay()
            scrollView.layoutIfNeeded()
       }
    }
    
    public func addView(view: Any, at index: Int? = nil) {
        DispatchQueue.main.async {
            (index != nil) ? self.content.insertArrangedSubview(view as! UIView, at: index!) : self.content.addArrangedSubview(view as! UIView)
            
//            self.content.addSubview(view as! UIView)
//            self.content.layoutIfNeeded()
//            self.content.subviews.last?.layoutIfNeeded()
//            self.content.layoutIfNeeded()
        }
    }
    
}
