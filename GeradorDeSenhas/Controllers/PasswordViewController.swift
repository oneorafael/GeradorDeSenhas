//
//  PasswordViewController.swift
//  GeradorDeSenhas
//
//  Created by Rafael Oliveira on 09/03/21.
//  Copyright © 2021 Rafael Oliveira. All rights reserved.
//

import UIKit
import NotificationBannerSwift
class PasswordViewController: UIViewController {
    
    //    MARK: - IBOutlets
    @IBOutlet weak var lbNumberOfCharacteres: UILabel!
    @IBOutlet weak var swCapitalLetters: UISwitch!
    @IBOutlet weak var swLowercase: UISwitch!
    @IBOutlet weak var swNumbers: UISwitch!
    @IBOutlet weak var swSpecialCharacteres: UISwitch!
    @IBOutlet weak var tfPasswordGenerated: UITextField!
    @IBOutlet weak var generateButton: UIButton!
    
    var passwordViewModel = PasswordViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
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
    /// Verifica a senha possui mais de 8 caracteres, caso contrario retorna um banner
    /// Se ao menos um switch está ativado, ele retorna a senha gerada pela função generate da ViewModel.
    func generateNewPassword(){
        tfPasswordGenerated.text = ""
        guard let senderValue = lbNumberOfCharacteres.text else {return}
        guard let number = Int(senderValue) else {return}
        let status = passwordViewModel.checkingSwitchStatus(useCapitalLetters: swCapitalLetters.isOn, useLowercase: swLowercase.isOn , useNumbers: swNumbers.isOn, useSpecialCharacteres: swSpecialCharacteres.isOn)
        let passwordSecurityStatus = passwordViewModel.checkNumberOfCharacters(NumberOfCharacters: number)
        
        if status == false{
            getAlert(_message: "Selecione ao menos uma opção de dados antes de gerar a sua senha.")
        } else {
            if passwordSecurityStatus == false {
                let banner = NotificationBanner(title: "Senha insegura", subtitle: "Utilize uma senha com no minimo 8 digitos", style: .danger)
                banner.show()
            }
            let password = passwordViewModel.generate(NumberOfCharacteres: number, useCapitalLetters: swCapitalLetters.isOn, useLowercase: swLowercase.isOn, useNumbers: swNumbers.isOn, useSpecialCharacteres: swSpecialCharacteres.isOn)
            tfPasswordGenerated.text = password
        }
    }
    
    //    Alert
    func getAlert(_message:String){
        let alert = UIAlertController(title: "Alerta", message: _message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

