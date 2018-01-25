//
//  ViewController.swift
//  TipApp
//
//  Created by John Farina (JFARI1364) on 1/19/18.
//  Copyright © 2018 UNG CSCI 3660. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var tipCalculatorModel = TipCalculatorModel()
    @IBOutlet weak var displayBill: UILabel!
    @IBOutlet weak var tipOutlet: UILabel!
    @IBOutlet weak var tipPercentOutlet: UILabel!
    @IBOutlet weak var finalBillOutlet: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    
    // Function for the "X" or clear button
    // When this button is touched, return a text/String value of 0
    @IBAction func touchReset(_ sender: UIButton) {
        displayBill.text = "0"
    }
    
    // Function for the decimal button
    // This function checks to see if there is already a decimal (.) within the displayBill UILabel
    @IBAction func touchDecimal(_ sender: UIButton) {
        let decimal = sender.currentTitle!
        if decimal == "." && displayBill.text!.contains(".") { // If there is a decimal detected, return nothing
            return
            } else {
                let currentDisplay = displayBill.text! // If there is not a decimal, return a decimal (.) value
                displayBill.text = currentDisplay + decimal
            }
            
        }
    
    // Function for the Tip Slider
    // Slider allows users to set a custom tip value between 0% and 30%
    @IBAction func customTipSlider(_ sender: UISlider) {
        tipPercentOutlet.text! = "Tip Percentage: " + String(Int(sender.value)) + "%" // Displays value of tip as a String to user
        let tipPercent = Int(sender.value)
        let bill = Double(displayBill.text!)!
        let tupleResult = tipCalculatorModel.computeTip(tipSlider: Double(Int(tipPercent)), bill: bill) // Use method inside model to calculate tip value
        tipOutlet.text = "$" + String(format:"%.02f",tupleResult.tip) // Returns value as a String for the tip, dollar, amount
        finalBillOutlet.text = "$" + String(format:"%.02f",tupleResult.finalBill)// Returns value as a String for final, bill, amount
    }
    
    // Function for digit buttons: 0 through 9
    // Displays values assigned to the button on display/main storyboard
    @IBAction func touchDigit(_ sender: UIButton) {
        if displayBill.text == "0"{
            displayBill.text = sender.currentTitle!
        }else{
            displayBill.text = displayBill.text! + sender.currentTitle!
        }
        
    }
    
}
