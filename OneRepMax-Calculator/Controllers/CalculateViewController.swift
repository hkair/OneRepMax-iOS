//
//  ViewController.swift
//  OneRepMax-Calculator
//
//  Created by Hobin Kang on 2020-10-12.
//  Copyright © 2020 Hobin Kang. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var bodyWeightLabel: UILabel!
    @IBOutlet weak var bodyWeightSlider: UISlider!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var repLabel: UILabel!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var repSlider: UISlider!
    @IBOutlet weak var switchState: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func bodyWeightSliderChanged(_ sender: UISlider) {
        let bodyweight = String(format: "%.2f", sender.value)
        bodyWeightLabel.text = "\(bodyweight)lbs"
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
        let weight = weightSlider.value
        let rep = round(repSlider.value)
        let bodyweight = round(bodyWeightSlider.value)
        
        calculatorBrain.calculateMax(weight: weight, rep: rep, bodyweight: bodyweight)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.maxValue = calculatorBrain.getMaxValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
        
    }
    
}

