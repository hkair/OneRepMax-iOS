//
//  ResultViewController.swift
//  OneRepMax-Calculator
//
//  Created by Hobin Kang on 2020-10-12.
//  Copyright © 2020 Hobin Kang. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var maxValue: String?
    var advice: String?
    var color: UIColor?

    @IBOutlet weak var maxLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        maxLabel.text = "\(maxValue!)lbs"
        rankLabel.text = advice
        view.backgroundColor = color
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
