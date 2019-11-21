//
//  SettingsViewController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Chelsi Christmas on 11/20/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var sizeSlider: UISlider!
    
    @IBOutlet weak var sizeStepper: UIStepper!
    
    @IBOutlet weak var sizeFontLabel: UILabel!
    
    var titleFontSize: Double?
    var subtitleFontSize: Double?

    
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
        titleFontSize = sender.value
        subtitleFontSize = ((sender.value) - 5.0 )
    }
    
    

}


