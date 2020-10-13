//
//  CalculatorBrain.swift
//  OneRepMax-Calculator
//
//  Created by Hobin Kang on 2020-10-12.
//  Copyright © 2020 Hobin Kang. All rights reserved.
//

import UIKit

struct CalculatorBrain {

    var max: MaxRep?
    let oneRepMaxDict : [Int : Float] = [1: 1.0, 2: 0.97, 3: 0.94, 4: 0.92, 5: 0.89, 6: 0.86, 7: 0.83, 8: 0.81, 9: 0.78, 10: 0.75, 11: 0.73, 12: 0.71, 13: 0.70, 14: 0.68, 15: 0.67, 16: 0.65, 17: 0.64, 18: 0.63, 19: 0.61, 20: 0.6]
    
    // Squat Standards
    let maleStandards: [Int : Array<Int>] = [
        110 : [71, 112, 164, 226, 226],
        120 : [84, 128, 184, 249, 321],
        130 : [98, 144, 203, 271, 346],
        140 : [110, 160, 221, 293, 370],
        150 : [123, 175, 239, 313, 393],
        160 : [136, 190, 256, 333, 415],
        170 : [148, 204, 273, 352, 437],
        180 : [160, 219, 290, 371, 457],
        190 : [172, 233, 306, 389, 477],
        200 : [184, 246, 321, 406, 497],
        210 : [195, 259, 336, 423, 515],
        220 : [207, 272, 351, 440, 534],
        230 : [218, 285, 365, 456, 551],
        240 : [229, 297, 379, 471, 569],
        250 : [239, 310, 393, 487, 585],
        260 : [250, 322, 407, 502, 602],
        270 : [260, 333, 420, 516, 618],
        280 : [270, 345, 433, 530, 633],
        290 : [280, 356, 445, 544, 648],
        300 : [290, 367, 457, 558, 663],
        310 : [299, 378, 470, 571, 678]
    ]
    
    let femaleStandards: [Int : Array<Int>] = [
        90 : [40, 71, 114, 167, 226],
        100 : [46, 79, 124, 179, 241],
        110 : [52, 87, 134, 191, 254],
        120 : [58, 95, 143, 202, 267],
        130 : [63, 102, 152, 212, 278],
        140 : [69, 109, 160, 222, 290],
        150 : [74, 115, 168, 231, 300],
        160 : [79, 121, 175, 240, 310],
        170 : [84, 127, 183, 248, 320],
        180 : [89, 133, 190, 256, 329],
        190 : [93, 139, 196, 264, 338],
        200 : [98, 144, 203, 271, 346],
        210 : [102, 150, 209, 279, 354],
        220 : [106, 155, 215, 286, 362],
        230 : [110, 160, 221, 292, 370],
        240 : [114, 164, 227, 299, 377],
        250 : [118, 169, 232, 305, 384],
        260 : [122, 174, 238, 311, 391]
    ]
    
    
    func roundToTens(x : Float) -> Int {
        return 10 * Int(round(x / 10.0))
    }
    
    func getMaxValue() -> String {
        let maxTo1DecimalPlace = String(format: "%.1f", max?.value ?? 0.0)
        return maxTo1DecimalPlace
    }
    
    func getAdvice() -> String {
        return max?.advice ?? "No Advice"
    }
    
    func getColor() -> UIColor {
        return max?.color ?? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    mutating func calculateMax(weight: Float, rep: Float, bodyweight: Float) {
        
        
        let maxValue = (weight / oneRepMaxDict[Int(round(rep))]!)
        let roundedWeight = roundToTens(x: bodyweight)
        
        let weightStandard = maleStandards[roundedWeight]!
        
        if maxValue < (Float(weightStandard[0]) + Float(weightStandard[1]))/2 {
            max = MaxRep(value: maxValue, advice: "You are a Beginner", color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
        } else if (maxValue >= (Float(weightStandard[0]) + Float(weightStandard[1]))/2 && maxValue < (Float(weightStandard[1]) + Float(weightStandard[2]))/2 ) {
            max = MaxRep(value: maxValue, advice: "You are a Novice", color: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1))
        } else if (maxValue >= (Float(weightStandard[1]) + Float(weightStandard[2]))/2 && maxValue < (Float(weightStandard[2]) + Float(weightStandard[3]))/2 ) {
            max = MaxRep(value: maxValue, advice: "You are an Intermediate", color: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
        } else if (maxValue >= (Float(weightStandard[2]) + Float(weightStandard[3]))/2 && maxValue < (Float(weightStandard[3]) + Float(weightStandard[4]))/2 ){
            max = MaxRep(value: maxValue, advice: "You are Advanced", color: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))
        } else {
            max = MaxRep(value: maxValue, advice: "You are Elite", color: #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1))
        }
    }
}
