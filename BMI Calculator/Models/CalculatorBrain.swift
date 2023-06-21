//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Jesus Robles Garcia on 6/17/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import SwiftUI

struct CalculatorBrain {

    var bmi: BMI?
    var bmiAdvice: String?
    var bkgColor: UIColor?
    
    func getBMIValue() -> String {
        let bmiValue = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiValue
        
   }
    
    mutating func calculateBMI(_ weight: Float, _ height: Float) { // include space to refer to the vars internally
        let bmiValue = (weight / pow(height,2))
        
        switch bmiValue {
            case  0...18.4:
                bmiAdvice = "Eat more pies!"
                bkgColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
                bmi = BMI(value: bmiValue, advice: bmiAdvice!, color: bkgColor!)
            case 18.5...24.9:
                bmiAdvice = "Fit as a fiddle!"
                bkgColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
                bmi = BMI(value: bmiValue, advice: bmiAdvice!, color: bkgColor!)
            case _ where bmiValue > 24.9:
                bmiAdvice = "Eat less pies!"
                bkgColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
                bmi = BMI(value: bmiValue, advice: bmiAdvice!, color: bkgColor!)
            default:
                bmiAdvice = "Error in calculation"
                bkgColor = .black
        }
   }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice"
    }
   
    func getColor() -> UIColor {
        return bmi?.color ?? .white
    }
 

    
}
