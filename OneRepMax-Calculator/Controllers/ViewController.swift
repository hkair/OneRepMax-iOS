//
//  ViewController.swift
//  OneRepMax-Calculator
//
//  Created by Hobin Kang on 2020-10-12.
//  Copyright © 2020 Hobin Kang. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var repLabel: UILabel!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var repSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let weight = String(format: "%.2f", sender.value)
        weightLabel.text = "\(weight)lbs"
    }
    
    @IBAction func repSliderChanged(_ sender: UISlider) {
        let rep = String(format: "%.0f", sender.value)
        repLabel.text = "\(rep) Reps"
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let oneRepMaxDict : [Int : Float] = [1: 1.0,
                                             2: 0.97,
                                             3: 0.94,
                                             4: 0.92,
                                             5: 0.89,
                                             6: 0.86,
                                             7: 0.83,
                                             8: 0.81,
                                             9: 0.78,
                                             10: 0.75,
                                             11: 0.73,
                                             12: 0.71,
                                             13: 0.70,
                                             14: 0.68,
                                             15: 0.67,
                                             16: 0.65,
                                             17: 0.64,
                                             18: 0.63,
                                             19: 0.61,
                                             20: 0.6]
        let weight = weightSlider.value
        let rep = Int(repSlider.value)
     
        let max = (weight / oneRepMaxDict[1]!)
                                             
        
    }
    
}

