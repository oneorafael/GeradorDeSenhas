//
//  ViewController.swift
//  GeradorDeSenhas
//
//  Created by Rafael Oliveira on 05/07/18.
//  Copyright © 2018 Rafael Oliveira. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var tfTotalPasswords: UITextField!
    
    @IBOutlet weak var tfNumberOfCharacteres: UITextField!
    @IBOutlet weak var swletters: UISwitch!
    
    @IBOutlet weak var swCapitalLetters: UISwitch!
    
    @IBOutlet weak var swNumbers: UISwitch!
    
    @IBOutlet weak var swSpecialCharacteres: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let passwordsViewController = segue.destination as! PasswordsViewController
        if let numberofpasswords = Int(tfTotalPasswords.text!){
            passwordsViewController.numberOfPasswords = numberofpasswords
        }
        if let numberofcharacteres = Int(tfNumberOfCharacteres.text!){
            passwordsViewController.numberOfCharacteres = numberofcharacteres
        }
        passwordsViewController.useLetters = swletters.isOn
        passwordsViewController.useSpecialCharacteres = swSpecialCharacteres.isOn
        passwordsViewController.useNumbers = swNumbers.isOn
        passwordsViewController.useCapitalLetters = swCapitalLetters.isOn
        
        view.endEditing(true)
    }
    

    
}

