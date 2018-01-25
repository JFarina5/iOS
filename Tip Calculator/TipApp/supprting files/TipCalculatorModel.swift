//
//  TipCalculatorModel.swift
//  TipApp
//
//  Created by John Farina (JFARI1364) on 1/19/18.
//  Copyright © 2018 UNG CSCI 3660. All rights reserved.
//

import Foundation

class TipCalculatorModel{
    var tip: Double=0.0, finalBill: Double=0.0, feedBack: String=""
    
    // Function to calculate tip from slider value and bill amount
    // Calculates both the tip value and the finalBill value, then returns both values to display
    func computeTip(tipSlider: Double, bill: Double) -> (tip: Double, finalBill: Double){
        tip = (tipSlider * bill)/100 // Equation to find value of tip
        finalBill = tip + bill // Equation to find final bill value (with tip)
        return (tip, finalBill)
    }
    
    // Function to return a simple String value to the user
    func getFeedBack() -> String{
        feedBack = "Thank you! Hope to see you again."
        return feedBack
    }
    
}
