//
//  PasswordsViewController.swift
//  GeradorDeSenhas
//
//  Created by Rafael Oliveira on 05/07/18.
//  Copyright © 2018 Rafael Oliveira. All rights reserved.
//

import UIKit

class PasswordsViewController: UIViewController {
    
    @IBOutlet weak var tvPasswords: UITextView!
    var numberOfCharacteres:Int = 10
    var numberOfPasswords:Int = 1
    var useLetters:Bool!
    var useNumbers:Bool!
    var useCapitalLetters:Bool!
    var useSpecialCharacteres:Bool!
    
    var passwordgenerator: PGenerator!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordgenerator = PGenerator(numberOfCharacteres: numberOfCharacteres, useLetters: useLetters, useNumbers: useNumbers, useCapitalLetters: useCapitalLetters, useSpecialCharacteres: useSpecialCharacteres)
        generate()
    }
    
    func generate(){
        tvPasswords.text = " "
        tvPasswords.scrollRangeToVisible(NSRange(location: 0, length: 0))
        let passwords = passwordgenerator.generate(total: numberOfPasswords)
        for password in passwords {
            tvPasswords.text.append(password + "\n\n")
        }
    }
    
    @IBAction func btnGenerate(_ sender: Any) {
        generate()
    }
    
    
    
    
    
}
