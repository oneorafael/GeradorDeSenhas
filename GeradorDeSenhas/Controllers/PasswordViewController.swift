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
    @IBOutlet weak var slNumberOfCharacters: UISlider!
    
    var passwordViewModel = PasswordViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slNumberOfCharacters.value = 8
    }
    
    //    MARK:- Actions
    
    @IBAction func sliderNumberOfCharacteresHasChanged(_ sender: UISlider) {
        lbNumberOfCharacteres.text = String(format: "%.0f", sender.value)
    }
    
    /// Botão gerar senha
    @IBAction func GenerateButtonHasPressed(_ sender: UIButton) {
        generateNewPassword()
    }
    
    func generateNewPassword() {
        tfPasswordGenerated.text = ""
        guard let slSenderValue = lbNumberOfCharacteres.text else {return}
        guard let numberOfCharacters = Int(slSenderValue) else {return}
        let useCapitalLetters = passwordViewModel.useNumbers(numbers: swCapitalLetters.isOn)
        let useLowercase = passwordViewModel.useLowercase(lowercase: swLowercase.isOn)
        let useNumbers = passwordViewModel.useNumbers(numbers: swNumbers.isOn)
        let useSpecialCharacters = passwordViewModel.useSpecialCharacters(specialCharacters: swSpecialCharacteres.isOn)
        
        let checkingSwitchStatus = passwordViewModel.checkingSwitchStatus(useCapitalLetters: useCapitalLetters, useLowercase: useLowercase, useNumbers: useNumbers, useSpecialCharacters: useSpecialCharacters )
        
        if checkingSwitchStatus == true {
            let password = passwordViewModel.passwordGenerate(numberfCharacters: numberOfCharacters, lowercase: useLowercase, numbers: useNumbers, SpecialCharacters: useSpecialCharacters, capitalLetters: useCapitalLetters)
            tfPasswordGenerated.text = password
        } else {
            getAlert(_message: "Selecione ao menos uma opção de dados antes de gerar a sua senha.")
            swNumbers.isOn = true
            loadViewIfNeeded()
        }
        
        let loadBanner = passwordViewModel.NumberOfCharactersIsValid(number: numberOfCharacters)
        
        loadBanner == true ? nil : getBanner(_title: "Senha insegura", _subtitle: "Utilize uma senha com no minimo 8 digitos")
    }
    
    //    Alert
    func getAlert(_message:String){
        let alert = UIAlertController(title: "Alerta", message: _message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func getBanner(_title: String , _subtitle: String) {
        let banner = NotificationBanner(title: _title, subtitle: _subtitle, style: .danger)
        banner.show()
    }
}

