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
    
    var currentStep: String = ""
    var history = [String]()
    
    @IBOutlet weak var buttonRPN: UILabel!
    @IBOutlet weak var display: UILabel!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier! == "historySegue") {
            let dest = segue.destination as! SecondViewController
            dest.history = self.history
        }
    }

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
                currentStep += "."
                self.display.text! += "."
            }
        case "0":
            currentStep += "0"
            if (self.display.text! != "0") {
                self.display.text! += "0"
            }
        case "1":
            if (display.text! == "0") {
                display.text = ""
            }
            self.display.text! += "1"
            currentStep += "1"
        case "2":
            if (display.text! == "0") {
                display.text = ""
            }
            self.display.text! += "2"
            currentStep += "2"
        case "3":
            if (display.text! == "0") {
                display.text = ""
            }
            self.display.text! += "3"
            currentStep += "3"
        case "4":
            if (display.text! == "0") {
                display.text = ""
            }
            self.display.text! += "4"
            currentStep += "4"
        case "5":
            if (display.text! == "0") {
                display.text = ""
            }
            self.display.text! += "5"
            currentStep += "5"
        case "6":
            if (display.text! == "0") {
                display.text = ""
            }
            self.display.text! += "6"
            currentStep += "6"
        case "7":
            if (display.text! == "0") {
                display.text = ""
            }
            self.display.text! += "7"
            currentStep += "7"
        case "8":
            if (display.text! == "0") {
                display.text = ""
            }
            self.display.text! += "8"
            currentStep += "8"
        case "9":
            if (display.text! == "0") {
                display.text = ""
            }
            self.display.text! += "9"
            currentStep += "9"
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
                    currentStep += " + => \(Int(result))"
                    history.append(currentStep)
                    currentStep = ""
                } else {
                    self.display.text! = ("\(result)")
                    currentStep += " + => \(result)"
                    history.append(currentStep)
                    currentStep = ""
                }
                numbersRPN = []
                enter = false
            } else {
                self.operation = "+"
                currentStep += " + "
            }
        case "-":
            if (stateRPN) {
                let num2 = Double(self.display.text!)!
                let result = numbersRPN[0] - num2
                let isInteger = floor(result) == result
                if (isInteger) {
                    self.display.text! = ("\(Int(result))")
                    currentStep += " - => \(Int(result))"
                    history.append(currentStep)
                    currentStep = ""
                } else {
                    self.display.text! = ("\(result)")
                    currentStep += " - => \(result)"
                    history.append(currentStep)
                    currentStep = ""
                }
                numbersRPN = []
                enter = false
            } else {
                self.operation = "-"
                currentStep += " - "
            }
        case "x":
            if (stateRPN) {
                let num2 = Double(self.display.text!)!
                let result = numbersRPN[0] * num2
                let isInteger = floor(result) == result
                if (isInteger) {
                    self.display.text! = ("\(Int(result))")
                    currentStep += " x => \(Int(result))"
                    history.append(currentStep)
                    currentStep = ""
                } else {
                    self.display.text! = ("\(result)")
                    currentStep += " x => \(result)"
                    history.append(currentStep)
                    currentStep = ""
                }
                numbersRPN = []
                enter = false
            } else {
                self.operation = "x"
                currentStep += " x "
            }
        case "/":
            if (stateRPN) {
                let num2 = Double(self.display.text!)!
                let result = numbersRPN[0] / num2
                let isInteger = floor(result) == result
                if (isInteger) {
                    self.display.text! = ("\(Int(result))")
                    currentStep += " / => \(Int(result))"
                    history.append(currentStep)
                    currentStep = ""
                } else {
                    self.display.text! = ("\(result)")
                    currentStep += " / => \(result)"
                    history.append(currentStep)
                    currentStep = ""
                }
                numbersRPN = []
                enter = false
            } else {
                self.operation = "/"
                currentStep += " / "
            }
        case "%":
            if (stateRPN) {
                let num2 = Double(self.display.text!)!
                let result = numbersRPN[0].truncatingRemainder(dividingBy: num2)
                let isInteger = floor(result) == result
                if (isInteger) {
                    self.display.text! = ("\(Int(result))")
                    currentStep += " % => \(Int(result))"
                    history.append(currentStep)
                    currentStep = ""
                } else {
                    self.display.text! = ("\(result)")
                    currentStep += " % => \(result)"
                    history.append(currentStep)
                    currentStep = ""
                }
                numbersRPN = []
                enter = false
            } else {
                self.operation = "%"
                currentStep += " % "
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
            case "x":
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
                currentStep += " = \(Int(result))"
                history.append(currentStep)
                currentStep = ""
            } else {
                self.display.text! = ("\(result)")
                currentStep += " = \(result)"
                history.append(currentStep)
                currentStep = ""
            }
            
        case "Fact.":
            if (floor(Double(self.display.text!)!) == Double(self.display.text!)!) {
                let result = factorial(num: Double(self.display.text!)!)
                self.display.text! = ("\(Int(result))")
                currentStep += "Fact. = \(Int(result))"
                history.append(currentStep)
                currentStep = ""
            } else {
                self.display.text! = ("0")
                currentStep += "Fact. = 0"
            }
            numbers = []
            num1 = 0
            
        case "Count":
            if (stateRPN) {
                let num2 = Double(self.display.text!)!
                numbersRPN.append(num2)
                let result = numbersRPN.count
                self.display.text! = ("\(result)")
                currentStep += " Count = \(result)"
                history.append(currentStep)
                currentStep = ""
                numbersRPN = []
                enter = false
            } else {
                operation = "Count"
                currentStep += " Count "
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
                    currentStep += " Avg. = \(Int(result))"
                    history.append(currentStep)
                    currentStep = ""
                } else {
                    self.display.text! = ("\(result)")
                    currentStep += " Avg. = \(result)"
                    history.append(currentStep)
                    currentStep = ""
                }
                numbersRPN = []
                enter = false
            } else {
                operation = "Avg."
                currentStep += " Avg. "
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
                let isInteger = floor(num) == num
                if (isInteger) {
                    //currentStep += "\(Int(num)) "
                    currentStep += " "
                } else {
                    //currentStep += "\(num) "
                    currentStep += " "
                }
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

