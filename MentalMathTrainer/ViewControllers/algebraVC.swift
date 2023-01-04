//
//  algebraVC.swift
//  MentalMathTrainer
//
//  Created by Jonathan Ouyang on 12/26/22.
//

import Foundation
import UIKit



class algebraVC: UIViewController {
    
    
    var operation: String! = ""
    var numDigits: Int! = 0
    var numQuestions: Int! = 30
    var hasDecimals: Bool! = false
    var q: Int = 1
    var k: Int = 0
    
    
    
    func addDoneButtonOnNumpad(textField: UITextField) {
        
        let keypadToolbar: UIToolbar = UIToolbar()
        
        // add a done button to the numberpad
        keypadToolbar.items=[
            UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: textField, action: #selector(UITextField.resignFirstResponder)),
            UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        ]
        keypadToolbar.sizeToFit()
        // add a toolbar with a done button above the number pad
        textField.inputAccessoryView = keypadToolbar
    }//addDoneToKeyPad
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBOutlet weak var operationLabel: UILabel!
    @IBOutlet weak var leftNum: UILabel!
    @IBOutlet weak var rightNum: UILabel!
    @IBOutlet weak var operationSign: UIImageView!
    @IBOutlet weak var answerField: UITextField!
    @IBOutlet weak var questionNumber: UILabel!
    @IBOutlet weak var correctNumber: UILabel!
    
    
    @IBAction func nextButton(_ sender: UIButton) {
        
        if (q != numQuestions) {
            if !(answerField.text!.isEmpty) {
              checkAnswer(a: answerField.text!)
              setNumbers()
              questionNumber.text = "Question Number: \(q)"
            } else {
              print("Answer field is empty")
            }
          } else {
            print("congrats")
          }
          answerField.text = ""
        
    }
    
    @IBAction func dismissButton(_ sender: UIButton) {
        k = 0
        q = 1
        questionNumber.text = "Question Number: \(q)"
        correctNumber.text = "\(k)/\(q) Right!"
        dismiss(animated: true)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        addDoneButtonOnNumpad(textField: answerField)
        
        
        
        operationLabel.text = operation
        setSign()
        digitControl()
        setNumbers()
        
        /*
         print("-=-=-=-=-=-=-=-=-=-=-")
         print("Operation is \(operation!)")
         setSign()
         print("Numbers will contain \(numDigits!) digit")
         print("There are \(numQuestions!) Questions")
         print("Will have decimals: \(hasDecimals!)")*/
    }
    
    //Operations
    
    
    
    
    //var a: Int = 0
    //var b: Int = 0
    var c: Int = 0
    var correctAnswer: String? = "0"
    
    func digitControl() {
        switch numDigits {
        case 1:
            c = 9
        case 2:
            c = 99
        case 3:
            c = 999
        case 4:
            c = 9999
        case 5:
            c = 99999
        default:
            c = 99999
        }
    }
    
    
    
    var randomTen: () -> Double {
        get {
            return {
                var x = 1
                for _ in 1...Int.random(in: 1...self.numDigits!) {
                    x *= 10
                }
                return Double(x)
            }
        }
    }
    
    
    
    func setSign() {
        if (operation! == "Addition") {
            operationSign.image = UIImage(systemName: "plus")
        } else if (operation! == "Subtraction") {
            operationSign.image = UIImage(systemName: "minus")
        } else if (operation! == "Multiplication") {
            operationSign.image = UIImage(systemName: "multiply")
        } else if (operation! == "Division") {
            operationSign.image = UIImage(systemName: "divide")
        } else {
            operationSign.image = UIImage(systemName: "link")
        }
    }
    
    @IBAction func dismissKeypad(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    

    
    //Operation Control
    func setNumbers() {
        if (operation! == "Addition") {
            if (hasDecimals == false) {
                let a = Int.random(in: 1...c)
                let b = Int.random(in: 1...c)
                leftNum.text = String(a)
                rightNum.text = String(b)
                correctAnswer = String(Double(a+b))
                
            } else {
                var a = Double(Int.random(in: 1...c))
                var b = Double(Int.random(in: 1...c))
                a = a/randomTen()
                b = b/randomTen()
                leftNum.text = String(a)
                rightNum.text = String(b)
                correctAnswer = String(format: "%.6f", Double(a+b))
                print(a)
                print(b)
                print(correctAnswer!)
            }
            
        } else if (operation! == "Subtraction") {
            if (hasDecimals == false) {
                let a = Int.random(in: 1...c)
                let b = Int.random(in: 1...c)
                leftNum.text = String(a)
                rightNum.text = String(b)
                correctAnswer = String(Double(a-b))
            } else {
                var a = Double(Int.random(in: 1...c))
                var b = Double(Int.random(in: 1...c))
                a = a/randomTen()
                b = b/randomTen()
                leftNum.text = String(a)
                rightNum.text = String(b)
                correctAnswer = String(format: "%.6f", Double(a-b))
            }
        } else if (operation! == "Multiplication") {
            if (hasDecimals == false) {
                let a = Int.random(in: 1...c)
                let b = Int.random(in: 1...c)
                leftNum.text = String(a)
                rightNum.text = String(b)
                correctAnswer = String(Double(a*b))
            } else {
                var a = Double(Int.random(in: 1...c))
                var b = Double(Int.random(in: 1...c))
                a = a/randomTen()
                b = b/randomTen()
                leftNum.text = String(a)
                rightNum.text = String(b)
                correctAnswer = String(format: "%.6f", Double(a*b))
            }
        } else if (operation! == "Division") {
            if (hasDecimals == false) {
                while true {
                    let a = Int.random(in: 1...c)
                    let b = Int.random(in: 1...c)
                    if a % b == 0 {
                        correctAnswer = String(a/b)
                        leftNum.text = String(a)
                        rightNum.text = String(b)
                        print(correctAnswer!)
                        break
                    }
                }
             
             } else {
                 while true {
                     var a = Double(Int.random(in: 1...c))
                     var b = Double(Int.random(in: 1...c))
                     if (a/b).truncatingRemainder(dividingBy: 1) == 0 {
                         a = a/randomTen()
                         b = b/randomTen()
                         leftNum.text = String(a)
                         rightNum.text = String(b)
                         correctAnswer = String(format: "%.6f", Double(a/b))
                         break
                     }
                 }
        }
        } else {
            operationSign.image = UIImage(systemName: "link")
        }
    }
    
    func checkAnswer(a: String!) {
            let x = Double(a)!
            let u = String(format: "%.6f", x)
            if (u == correctAnswer!) {
                print("correct!")
                k += 1
            } else {
                print("wrong!")
                k += 0
            }
            correctNumber.text = "\(k)/\(q) Right!"
            q += 1
        }
    
    
    
}
