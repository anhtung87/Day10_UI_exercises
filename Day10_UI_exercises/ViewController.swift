//
//  ViewController.swift
//  Day10_UI_exercises
//
//  Created by Hoang Tung on 11/3/19.
//  Copyright © 2019 Hoang Tung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterView: CounterView!
    
    @IBOutlet weak var decreaseButton: plusButton!
    
    @IBOutlet weak var increaseButton: plusButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func increaseCounter(_ sender: Any) {
        counterView.increase()
    }
    
    @IBAction func decreaseCounter(_ sender: Any) {
        counterView.decrease()
    }
    
}

