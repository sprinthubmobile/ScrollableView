//
//  ViewController.swift
//  ScrollableViewExample
//
//  Created by Sprinthub on 15/02/2020.
//  Copyright © 2020 Sprinthub Mobile. All rights reserved.
//

import UIKit

class ViewController: ScrollableView {
    
    lazy var content: UIStackView = {
        let contentView = UIStackView(frame: .zero)
        contentView.axis = .vertical
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.clipsToBounds = true
        return contentView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.embedInScrollView(self.content)
        self.createViews()
    }
    
    func createViews() {
        let colors: [UIColor] = [
            UIColor.green,
            UIColor.blue,
            UIColor.red,
            UIColor.purple,
            UIColor.systemPink,
            UIColor.darkGray
        ]
        
        for _ in 0 ... 20 {
            let view = UIView(frame: .zero)
            view.translatesAutoresizingMaskIntoConstraints  = false
            view.clipsToBounds = true
            view.backgroundColor = colors.randomElement()
            self.content.addArrangedSubview(view)
            view.heightAnchor.constraint(equalToConstant: 200).isActive = true             
        }
        
        self.view.layoutIfNeeded()
    }


}

