//
//  RepMaxCalculator.swift
//  BMI Calculator
//
//  Created by Brandon Dowless on 3/10/22.
//

import Foundation

struct RepMaxCalculator {
   func repMaxCalculation(repSliderValue: Float, weightSliderValue: Float) -> Int {
        let repsResult = Int(repSliderValue * 2.5)
        let repsFinalResult = Double(100 - repsResult) / 100
        let max = Double(weightSliderValue) / repsFinalResult
        let finalResult = Int(max)
        
        return finalResult
    }
}
