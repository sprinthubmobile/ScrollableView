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
            UIColor.darkGray,
            UIColor.white,
            UIColor.yellow,
            UIColor.cyan,
        ]
        
        colors.enumerated().forEach({
            let view = UIView(frame: .zero)
            view.backgroundColor = $0.element
            
            self.addView(view: view)
            view.translatesAutoresizingMaskIntoConstraints = false
            view.clipsToBounds = true
            
            DispatchQueue.main.async {
                view.heightAnchor.constraint(equalToConstant: 200).isActive = true
                view.centerXAnchor.constraint(equalTo: self.content.centerXAnchor).isActive = true
                view.widthAnchor.constraint(equalTo: self.content.widthAnchor).isActive = true
            }
            if $0.offset == 0 {
                DispatchQueue.main.async {
                    view.topAnchor.constraint(equalTo: self.content.topAnchor).isActive = true
                }
            } else {
                let index = $0.offset-1
                DispatchQueue.main.async {
                    view.topAnchor.constraint(equalTo: self.content.subviews[index].bottomAnchor).isActive = true
                }
            }
            
            
        })
        
        
        
        self.view.layoutIfNeeded()
    }


}

