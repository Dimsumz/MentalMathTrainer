//
//  interSelectorVC.swift
//  MentalMathTrainer
//
//  Created by Jonathan Ouyang on 12/28/22.
//

import Foundation
import UIKit

class interSelectorVC: UIViewController {
    
    var tempOperation: String = ""
    var tempNumDigits: Int? = 0
    //var tempNumQuestions: Int? = 0
    var tempHasDecimals: Bool? = false
    let vc2: algebraVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "algebraVC") as! algebraVC
    
    /*
     var operation: String! = ""
     var numDigits: Int! = 0
     var numQuestions: Int! = 0
     var hasDecimals: Bool! = false
     */
    
    
    @IBOutlet weak var numDigits: UILabel!
    @IBOutlet weak var decimalSwitch: UISwitch!
    @IBOutlet weak var digitStepper: UIStepper!
    @IBAction func digitStepper(_ sender: UIStepper) {
        numDigits.text = String(Int(digitStepper.value))
    }
    
    @IBOutlet weak var greyBack1: UIImageView!
    @IBOutlet weak var greyBack2: UIImageView!
    @IBOutlet weak var greyBack3: UIImageView!
    
    
    override func viewDidLoad() {
        greyBack1.alpha = 0.8
        greyBack2.alpha = 0.8
        greyBack3.alpha = 0.8

    }
    
    // SLIDER CODE
    
    @IBOutlet weak var numQuestions: UILabel!
    @IBOutlet weak var numQuestionSlider: UISlider!
    
    @IBAction func numQuestionSlider(_ sender: UISlider) {
        let a = Int(round(sender.value/10))
        sender.value = Float(a*10)
        let b = a*10
        
        if (b == 60) {
            numQuestions.text = "Infinite"
            vc2.numQuestions = 999
        } else {
            numQuestions.text = String(b)
            vc2.numQuestions = b
        }
}
    
    
    
    @IBAction func continueButtonTapped(_ sender: UIButton) {
        //print(tempOperation)
        vc2.operation = tempOperation
        vc2.numDigits = Int(digitStepper.value)
        if (decimalSwitch.isOn) {
            vc2.hasDecimals = true
        } else {
            vc2.hasDecimals = false
        }
        
        vc2.modalPresentationStyle = .fullScreen
        self.present(vc2, animated: false, completion: nil)
        
    }
    
}


