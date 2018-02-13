//
//  ViewController.swift
//  Calculator
//
//  Created by Titas Datta on 10/02/18.
//  Copyright © 2018 Titas Datta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var outputLbl: UILabel!
    
    var numberOnScreen: Double = 0
    var previousNumber: Double = 0
    var performingMath: Bool = false
    var operation = 0
    var result: Double = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        outputLbl.text = "0"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func operandButtonPressed(_ sender: UIButton) {
        if outputLbl.text != "" && sender.tag < 18 {
            
            switch sender.tag {
            case 10:
                clearAll()
            case 12:
                numberOnScreen = numberOnScreen / 100
                outputLbl.text = "\(numberOnScreen)"
            case 13...16:
                previousNumber = Double(outputLbl.text!)!
                operation = sender.tag
            case 17:
                calculateResult()
                if result == floor(result) {
                    outputLbl.text = String(Int(result))
                }else {
                    outputLbl.text = String(format: "%.4f", result)
                }
            default:
                print("Nothing")
            }
            
            performingMath = true
        }
    }
    
    @IBAction func numericButtonPressed(_ sender: UIButton) {
        if performingMath == true {
            outputLbl.text = String(sender.tag)
            performingMath = false
        }else {
            if outputLbl.text == "0"{
                outputLbl.text = String(sender.tag)
            }else {
                outputLbl.text = outputLbl.text! + String(sender.tag)
            }
        }
        
        numberOnScreen = Double(outputLbl.text!)!
    }
    
    func calculateResult(){
        switch operation {
        case 13:
            result = previousNumber / numberOnScreen
        case 14:
            result = previousNumber * numberOnScreen
        case 15:
            result = previousNumber - numberOnScreen
        case 16:
            result = previousNumber + numberOnScreen
        default:
            print("Do nothing")
        }
    }
    
    func clearAll(){
        outputLbl.text = "0"
        numberOnScreen = 0
        previousNumber = 0
        performingMath = false
    }
    
}

