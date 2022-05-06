//
//  Logic.swift
//  Calculator
//
//  Created by uday danthala on 05/05/2022.
//

import Foundation
var view = ViewController() // Connection for ViewController
struct Logic { // Struct
    
    private var num : Double? // Global variable
    private var intercal : (n1: Double, calcMethod: String)? //Global Tuple
    
    mutating func set(_ num:Double) { // Function recives the value from ViewController
        self.num = num
    }
    
    mutating func calculate(symbol:String) -> Double? { // Function if the user taps on AC and =
        
        if let n = num {
            switch symbol{ // User Taps on AC the label return 0
            case "AC":
                
                view.arr.removeAll() // Remove elements in Array
                return 0 // return 0 in Label
            
            case "=": // User taps on = the performCalc function is called
                return performCalc(n2: n) // n Old value is assigned to n2 in performCalc Function
            default: // default
                intercal = ( n1: n, calcMethod: symbol)
            }
        }
        return nil
    }
    
    mutating func performCalc(n2:Double) -> Double? { // User taps on arthemetic Operator
        
        if let n1 = intercal?.n1,let method = intercal?.calcMethod { // n1 value is new value and n2 value is the old value
            
            switch method {
            case "+": // Perform Adddition
                return n1 + n2
            case "-": // Perform Subtraction
                return n1 - n2
            case "x": // Perform Multiplication
                return n1 * n2
            case "÷": // Perfrom Division
                return n1 / n2
            default: // default Error
                fatalError()
            }
        }
        return nil
        
    }
    
    
}
