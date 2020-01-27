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
    
    func didChangeValue(_ fontSize: Double)
    
}
class SettingsViewController: UIViewController {

    @IBOutlet weak var sizeSlider: UISlider!
    
    @IBOutlet weak var sizeStepper: UIStepper!
    
    @IBOutlet weak var sizeFontLabel: UILabel!
    
    
    weak var delegate: StepperAndSliderDelegate?
    var titleFontSize: Double?
    var subtitleFontSize: Double?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        delegate?.didChangeValue(titleFontSize!)
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
        titleFontSize = sender.value
        subtitleFontSize = ((sender.value) - 5.0 )
        delegate?.didChangeValue(titleFontSize!)
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        sizeStepper.value = Double(sender.value)
        sizeFontLabel.text = "\(Double(Int(sender.value)))"
        titleFontSize = Double(sender.value)
        subtitleFontSize = (Double(sender.value) - 5.0 )
        delegate?.didChangeValue(titleFontSize!)

    }

}


