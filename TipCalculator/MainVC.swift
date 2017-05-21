//
//  MainVC.swift
//  TipCalculator
//
//  Created by Than S. Chen on 5/19/17.
//  Copyright © 2017 edu.thanschen. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITextFieldDelegate {
    

    @IBOutlet weak var selectedTip: UILabel!

    @IBOutlet weak var subtotalEntry: UITextField!
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var numOfPeople: UITextField!
    @IBOutlet weak var tipPerPerson: UILabel!
    @IBOutlet weak var perPersonText: UILabel!
    @IBOutlet weak var startOverButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        subtotalEntry.delegate = self
        
        numOfPeople.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func sliderChange(sender: UISlider) {
        //get the slider
        let currentValue = Int(slider.value)
        
        //update display with slider
        selectedTip.text = "\(currentValue)%"
        
    }
    
    
    @IBAction func calTipPress(sender: UIButton) {
        
        if subtotalEntry.text == ""{
           subtotalEntry.text = "0.0"
        }
        if numOfPeople.text == ""{
            numOfPeople.text = "1"
        
        }
        tipPerPerson.hidden = false
        perPersonText.hidden = false
        startOverButton.hidden = false
        let subTotal = Float(subtotalEntry.text!)
        
        let split = Float(numOfPeople.text!)
        let perc  = Float(slider.value)
        
        let result = ((subTotal! * ( perc / 100) ) / split! )
        let result2 = String(format:"%.2f", result)
        tipPerPerson.text = "$\(result2)"
    }
    
    @IBAction func startOver(sender: UIButton) {
        
        tipPerPerson.hidden = true
        perPersonText.hidden = true
        startOverButton.hidden = true
        dismisskeyboard()
    }
    
    func dismisskeyboard(){
        subtotalEntry.resignFirstResponder()
        numOfPeople.canResignFirstResponder()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    override func motionBegan(motion: UIEventSubtype, withEvent event: UIEvent?) {
        dismisskeyboard()
    }
    
    
}

