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
    //var stateRPN = false
    var equals = false
    var stateOp = false
    
    @IBOutlet weak var display: UILabel!
    @IBAction func numbersSelected(sender: UIButton) {
        if (display.text! == "0") {
            display.text = ""
        }
        if (equals == true) {
            display.text = ""
            equals = false
        }
        if (stateOp == true) {
            display.text = ""
            stateOp = false
        }
        switch sender.titleLabel!.text! {
        case ".":
            if (self.display.text!.range(of: ".") == nil) {
                self.display.text! += "."
            }
        case "0":
            self.display.text! += "0"
        case "1":
            self.display.text! += "1"
        case "2":
            self.display.text! += "2"
        case "3":
            self.display.text! += "3"
        case "4":
            self.display.text! += "4"
        case "5":
            self.display.text! += "5"
        case "6":
            self.display.text! += "6"
        case "7":
            self.display.text! += "7"
        case "8":
            self.display.text! += "8"
        case "9":
            self.display.text! += "9"
        default:
            break
        }
    }
    
    @IBAction func operationSelected(sender: UIButton) {
        if (sender.titleLabel!.text! != "=") {
            num1 = Double(self.display.text!)!
            stateOp = true
        }
        switch (sender.titleLabel!.text!) {
        case "+":
            self.operation = "+"
        case "-":
            self.operation = "-"
        case "*":
            self.operation = "*"
        case "/":
            self.operation = "/"
        case "%":
            self.operation = "%"
            //self.display.text = "\(num1 * 0.01)"
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
                //result = num1 % num2
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
            let result = factorial(num: Double(self.display.text!)!)
            let isInteger = floor(result) == result
            if (isInteger) {
                self.display.text! = ("\(Int(result))")
            } else {
                self.display.text! = ("\(result)")
            }
            num1 = 0
            
        case "Count":
            operation = "Count"
            numbers.append(num1)
            num1 = 0

        case "Avg.":
            operation = "Avg."
            numbers.append(num1)
            num1 = 0
            
        case "AC":
            numbers = []
            num1 = 0
            operation = ""
            self.display.text! = "0"
        
//        case "RPN":
//            stateRPN = true
            
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

