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
    
    var pass = PasswordViewModel()
    
    override func viewDidLoad() {
        
    }
    
//    MARK:- Actions
    
    /// Altera o valor de caracteres de acordo com o slider
    /// - Parameter sender: UISlider
    @IBAction func sliderNumberOfCharacteresHasChanged(_ sender: UISlider) {
        lbNumberOfCharacteres.text = String(format: "%.0f", sender.value)
    }
    
    /// Botão gerar senha
    /// - Parameter sender: UIButton
    @IBAction func GenerateButtonHasPressed(_ sender: UIButton) {
        generateNewPassword()
    }
    
    /// Verifica primeiro se ao menos um switch está ativo, caso contrario retorna um alerta.
    /// Se ao menos um switch está ativado, ele retorna a senha gerada pela função generate da ViewModel.
    func generateNewPassword(){
        tfPasswordGenerated.text = ""
        guard let number = lbNumberOfCharacteres.text else {return}
        if !swCapitalLetters.isOn && !swLowercase.isOn && !swNumbers.isOn && !swSpecialCharacteres.isOn {
            print("ao menos 1 opção precisa estar marcada")
            //TODO: Enviar alerta
        } else {
            let password = pass.generate(NumberOfCharacteres: Int(number)!, useCapitalLetters: swCapitalLetters.isOn, useLowercase: swLowercase.isOn, useNumbers: swNumbers.isOn, useSpecialCharacteres: swSpecialCharacteres.isOn)
            tfPasswordGenerated.text = password
        }
    }
}

