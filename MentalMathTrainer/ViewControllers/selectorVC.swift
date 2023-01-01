//
//  selectorVC.swift
//  MentalMathTrainer
//
//  Created by Jonathan Ouyang on 12/26/22.
//

import Foundation
import UIKit

class selectorVC: UIViewController {
  
    // algChoices -> algSettings -> algScreen
    let vc: interSelectorVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "interSelectorVC") as! interSelectorVC
    
    @IBAction func algChoices(_ sender: UIButton) {
        vc.tempOperation = sender.currentTitle!
        
        self.present(vc, animated: true, completion: nil)
        //print(sender.currentTitle!)
    
    }
    
    
    
    
}
