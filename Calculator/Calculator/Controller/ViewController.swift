//
//  ViewController.swift
//  Calculator
//
//  Created by uday danthala on 05/05/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel! // Label to print Output
    var arr = [Int]() // Created an empty Array
    private var typingNumber: Bool = true // Global variable
    
    private var logic = Logic() // Connection for the Logic File
    private var value: Double {  //Converting the String value to Double
        get {
            guard let number = Double(displayLabel.text!) else { // Safely Converting String to Double and unwrapping using guard let
                fatalError()
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    @IBAction func calcPressed(_ sender: UIButton) { // Calculation Button pressed
        typingNumber = true // Display label reset
        
        logic.set(value) // User tapped value is assiging to the set function in Logic File
        if let calcmethod = sender.currentTitle { // Title of the Calculation Button tapped
            
            if let result = logic.calculate(symbol: calcmethod) { // Accesing the function in Logic file
                value = result  // Result is added to the Label
            }
            
        }
        
        
        
    }
    
    
    
    @IBAction func numPressed(_ sender: UIButton) { //User taps on Number
        
        if let num = sender.currentTitle { // Title of the button Tapped
            if typingNumber {
                displayLabel.text = num   // Inserting the number in Label
                typingNumber = false
            } else {
                if num == "." { // if . is used once Cant be used again
                    let isInt = floor(value) == value
                    
                    if !isInt { // if . not present can use for one time
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + num
            }
        }
        
        
    }
    
    
    @IBAction func ip (_ sender: UIButton) { // Input Button pressed
        
        typingNumber = true
        arr.append(Int(value))   // the value in the label is inserted in to the Empty Array
        arr.sort()  // Sorted the Array
        print(arr)
        
    }
    
    
    @IBAction func Mean(_ sender: UIButton) { // Mean Function
        if arr.isEmpty{ // If array is empty return
            return
        }
        let n = Double(arr.count) // Converting the count of array to Double
        let sum = arr.reduce(0, +) // Adding all the values in an array
        //print("Sum of Array is : ", sum)
        let mean = Double(sum)/n // Mean formula diving the sum of elemnts by total number elements
        
        value = Double(mean) // Added to the Value to display the result in Label
        print("mean is ", mean)
        arr.removeAll() // cleared the Array for new inputs
        
    }
    
    
    
    @IBAction func median(_ sender: UIButton) { // functiom for Median
        if arr.isEmpty{ // If array is empty return
            return
        }
        let b = arr.count // Array Count
        if b % 2 != 0{ // Checking wether the Array Count is Even or odd
            let a = arr[(b)/2]  // If array count is odd Directly print middle number in Array
            
            print(a)
            
        } else { // If the Array count is Even
            let c = b/2 // Index of Middle value of Array
            let d = c-1 // Index before the middle value in Array
            let median = Double((arr[c] + arr[d]))/2 // Median Formula if the Array is even add two elemts in the middle and divide the result by 2
            value = Double(median) // Coverting the result to Double and adding it to the label
            print(value)
        }
        arr.removeAll() // Clear the Array
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}

