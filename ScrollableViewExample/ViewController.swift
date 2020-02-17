//
//  ViewController.swift
//  ScrollableViewExample
//
//  Created by Sprinthub on 15/02/2020.
//  Copyright © 2020 Sprinthub Mobile. All rights reserved.
//

import UIKit

class ViewController: ScrollableView {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setup()
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
            self.addView(view: view)
            view.heightAnchor.constraint(equalToConstant: 200).isActive = true             
        }
        
        self.view.layoutIfNeeded()
    }


}

