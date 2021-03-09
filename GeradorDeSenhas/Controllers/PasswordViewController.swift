//
//  PasswordViewController.swift
//  GeradorDeSenhas
//
//  Created by Rafael Oliveira on 09/03/21.
//  Copyright © 2021 Rafael Oliveira. All rights reserved.
//

import UIKit
class PasswordViewController: UIViewController {
    
//    MARK: - IBOutlets
    @IBOutlet weak var lbNumberOfCharacteres: UILabel!
    @IBOutlet weak var swCapitalLetters: UISwitch!
    @IBOutlet weak var swLowercase: UISwitch!
    @IBOutlet weak var swNumbers: UISwitch!
    @IBOutlet weak var swSpecialCharacteres: UISwitch!
    @IBOutlet weak var tfPasswordGenerated: UITextField!
    
    override func viewDidLoad() {
        
    }
    
//    MARK:- Actions
    
    @IBAction func sliderNumberOfCharacteresHasChanged(_ sender: UISlider) {
        
        lbNumberOfCharacteres.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func GenerateButtonHasPressed(_ sender: UIButton) {
        
    }
}

