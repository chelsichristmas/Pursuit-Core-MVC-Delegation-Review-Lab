//
//  ViewController.swift
//  Delegation-Lab-Unit-4
//
//  Created by Chelsi Christmas on 1/27/20.
//  Copyright © 2020 Chelsi Christmas. All rights reserved.


// This is the object that's calling the delegate
// when is the delegate being called?
// When the slider is moved and when the stepper is called.
// So I'm going ot place the indicator in those functions
// where am I placing the delegate

import UIKit

protocol StepperAndSliderDelegate: AnyObject {
    
    func didChangeValue(titleFontSize: CGFloat)
    
}
class SettingsViewController: UIViewController {
    

    @IBOutlet weak var sizeSlider: UISlider!
    
    @IBOutlet weak var sizeStepper: UIStepper!
    
    @IBOutlet weak var sizeFontLabel: UILabel!
    
    
    weak var delegate: StepperAndSliderDelegate?
    // this is a property that is a weak reference to the SettingsViewController
    // we created this so that we can utilize the protocol method that we created in the protocol

    var titleFontSize: CGFloat = 0.0 {
        didSet {
            delegate?.didChangeValue(titleFontSize: titleFontSize)
        }
    }
       
    var subtitleFontSize: CGFloat = 0.0 {
        didSet {
            delegate?.didChangeValue(titleFontSize: subtitleFontSize)
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        configureSlider()
        configureStepper()
    }
    
    
    func configureSlider() {
        sizeSlider.minimumValue = 0.0
        sizeSlider.maximumValue = 30.0
        sizeSlider.value = 17.0
        
        
    }
    
    func configureStepper() {
        sizeStepper.minimumValue = 0
        sizeStepper.maximumValue = 30.0
        sizeStepper.value = 17.0
        
        sizeFontLabel.text = "\(sizeSlider.value)"
    }
    
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        sizeFontLabel.text = "\(sender.value)"
        sizeSlider.value = Float(sender.value)
        titleFontSize = CGFloat(sender.value)
        subtitleFontSize = CGFloat((sender.value) - 5.0 )
        
            }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        sizeStepper.value = Double(sender.value)
        sizeFontLabel.text = "\(Double(Int(sender.value)))"
        titleFontSize = CGFloat(sender.value)
        subtitleFontSize = (CGFloat(sender.value) - 5.0 )
        

    }

}


