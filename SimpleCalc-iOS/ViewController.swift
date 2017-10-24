//
//  ViewController.swift
//  SimpleCalc-iOS
//
//  Created by Jessie Kuo on 22/10/2017.
//  Copyright © 2017 appcat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var operation: String = ""
    var num1: Double = 0
    var numbers: [Double] = []
    var numbersRPN: [Double] = []
    var stateRPN = false
    var enter = false
    var equals = false
    var stateOp = false
    
    @IBOutlet weak var buttonRPN: UILabel!
    @IBOutlet weak var display: UILabel!
    @IBAction func numbersSelected(sender: UIButton) {
        if (equals) {
            display.text = ""
            equals = false
        }
        if (stateOp) {
            display.text = ""
            stateOp = false
        }
        if (enter) {
            display.text = ""
            enter = false
        }
        switch sender.titleLabel!.text! {
        case ".":
            if (self.display.text!.range(of: ".") == nil) {
                self.display.text! += "."
            }
        case "0":
            if (self.display.text! != "0") {
                self.display.text! += "0"
            }
        case "1":
            if (display.text! == "0") {
                display.text = ""
            }
            self.display.text! += "1"
        case "2":
            if (display.text! == "0") {
                display.text = ""
            }
            self.display.text! += "2"
        case "3":
            if (display.text! == "0") {
                display.text = ""
            }
            self.display.text! += "3"
        case "4":
            if (display.text! == "0") {
                display.text = ""
            }
            self.display.text! += "4"
        case "5":
            if (display.text! == "0") {
                display.text = ""
            }
            self.display.text! += "5"
        case "6":
            if (display.text! == "0") {
                display.text = ""
            }
            self.display.text! += "6"
        case "7":
            if (display.text! == "0") {
                display.text = ""
            }
            self.display.text! += "7"
        case "8":
            if (display.text! == "0") {
                display.text = ""
            }
            self.display.text! += "8"
        case "9":
            if (display.text! == "0") {
                display.text = ""
            }
            self.display.text! += "9"
        default:
            break
        }
    }
    
    @IBAction func operationSelected(sender: UIButton) {
        if (sender.titleLabel!.text! != "=" && sender.titleLabel!.text! != "RPN" && sender.titleLabel!.text! != "Enter") {
            num1 = Double(self.display.text!)!
            stateOp = true
        }
        switch (sender.titleLabel!.text!) {
        case "+":
            if (stateRPN) {
                let num2 = Double(self.display.text!)!
                let result = numbersRPN[0] + num2
                let isInteger = floor(result) == result
                if (isInteger) {
                    self.display.text! = ("\(Int(result))")
                } else {
                    self.display.text! = ("\(result)")
                }
                numbersRPN = []
                enter = false
            } else {
                self.operation = "+"
            }
        case "-":
            if (stateRPN) {
                let num2 = Double(self.display.text!)!
                let result = numbersRPN[0] - num2
                let isInteger = floor(result) == result
                if (isInteger) {
                    self.display.text! = ("\(Int(result))")
                } else {
                    self.display.text! = ("\(result)")
                }
                numbersRPN = []
                enter = false
            } else {
                self.operation = "-"
            }
        case "*":
            if (stateRPN) {
                let num2 = Double(self.display.text!)!
                let result = numbersRPN[0] * num2
                let isInteger = floor(result) == result
                if (isInteger) {
                    self.display.text! = ("\(Int(result))")
                } else {
                    self.display.text! = ("\(result)")
                }
                numbersRPN = []
                enter = false
            } else {
                self.operation = "*"
            }
        case "/":
            if (stateRPN) {
                let num2 = Double(self.display.text!)!
                let result = numbersRPN[0] / num2
                let isInteger = floor(result) == result
                if (isInteger) {
                    self.display.text! = ("\(Int(result))")
                } else {
                    self.display.text! = ("\(result)")
                }
                numbersRPN = []
                enter = false
            } else {
                self.operation = "/"
            }
        case "%":
            if (stateRPN) {
                let num2 = Double(self.display.text!)!
                let result = numbersRPN[0].truncatingRemainder(dividingBy: num2)
                let isInteger = floor(result) == result
                if (isInteger) {
                    self.display.text! = ("\(Int(result))")
                } else {
                    self.display.text! = ("\(result)")
                }
                numbersRPN = []
                enter = false
            } else {
                self.operation = "%"
            }
        case "=":
            equals = true
            let num2 = Double(self.display.text!)!
            var result: Double = 0
            switch self.operation {
            case "+":
                result = num1 + num2
            case "-":
                result = num1 - num2
            case "*":
                result = num1 * num2
            case "/":
                result = num1 / num2
            case "%":
                result = num1.truncatingRemainder(dividingBy: num2)
            case "Count":
                numbers.append(num2)
                result = Double(numbers.count)
                numbers = []
            case "Avg.":
                var total: Double = 0
                numbers.append(num2)
                for n in numbers {
                    total += n
                }
                result = total / Double(numbers.count)
                numbers = []
            default:
                break
            }
            num1 = 0
            let isInteger = floor(result) == result
            if (isInteger) {
                self.display.text! = ("\(Int(result))")
            } else {
                self.display.text! = ("\(result)")
            }
            
        case "Fact.":
            if (floor(Double(self.display.text!)!) == Double(self.display.text!)!) {
                let result = factorial(num: Double(self.display.text!)!)
                self.display.text! = ("\(Int(result))")
            } else {
                self.display.text! = ("0")
            }
            numbers = []
            num1 = 0
            
        case "Count":
            if (stateRPN) {
                let num2 = Double(self.display.text!)!
                numbersRPN.append(num2)
                let result = numbersRPN.count
                self.display.text! = ("\(result)")
                numbersRPN = []
                enter = false
            } else {
                operation = "Count"
                numbers.append(num1)
                num1 = 0
            }
        case "Avg.":
            if (stateRPN) {
                let num2 = Double(self.display.text!)!
                numbersRPN.append(num2)
                var total: Double = 0
                for n in numbersRPN {
                    total += n
                }
                let result = total / Double(numbersRPN.count)
                let isInteger = floor(result) == result
                if (isInteger) {
                    self.display.text! = ("\(Int(result))")
                } else {
                    self.display.text! = ("\(result)")
                }
                numbersRPN = []
                enter = false
            } else {
                operation = "Avg."
                numbers.append(num1)
                num1 = 0
            }
        case "AC":
            numbers = []
            numbersRPN = []
            num1 = 0
            operation = ""
            self.display.text! = "0"
            buttonRPN.text = ""
            stateRPN = false
            enter = false
        
        case "RPN":
            if (stateRPN) {
                stateRPN = false
                enter = false
                buttonRPN.text = ""
            } else {
                stateRPN = true
                buttonRPN.text = "RPN"
                self.display.text = "0"
            }
            
        case "Enter":
            if (stateRPN) {
                let num = Double(self.display.text!)!
                numbersRPN.append(num)
                enter = true
            }
            
        default:
            break
        }
    }
    
    func factorial(num: Double) -> Double {
        if num == 0 {
            return 1
        } else {
            return num * factorial(num: num - 1)
        }
    }
    
}

