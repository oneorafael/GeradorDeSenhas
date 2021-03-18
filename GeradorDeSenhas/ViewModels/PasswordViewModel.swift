//
//  PasswordViewModel.swift
//  GeradorDeSenhas
//
//  Created by Rafael Oliveira on 09/03/21.
//  Copyright © 2021 Rafael Oliveira. All rights reserved.
//

import Foundation

class PasswordViewModel {
    
    var passwordModel: Password!
    var passwordGenerated: String {return passwordModel.passwordGenerated}
    var passwords:[String] = []
    
    func useLowercase(lowercase:Bool) -> Bool {
        return lowercase
    }
    
    func useNumbers(numbers:Bool) -> Bool {
        return numbers
    }
    
    func useSpecialCharacters(specialCharacters:Bool) -> Bool {
        return specialCharacters
    }
    
    func useCapitalLetters(capitalLetters:Bool) -> Bool {
        return capitalLetters
    }
    
    func NumberOfCharactersIsValid(number:Int) -> Bool {
        var itsSecurityPassword = true
        if number < PasswordConstants.numberOfCharacters_min {
            itsSecurityPassword = false
        }
        return itsSecurityPassword
    }
    
    func passwordGenerate(numberfCharacters: Int, lowercase:Bool, numbers:Bool, SpecialCharacters:Bool, capitalLetters:Bool) -> String {
        passwords.removeAll()
        var password = ""
        var passowrdCharacters = ""
        passowrdCharacters += useLowercase(lowercase: lowercase) == true ? "abcdefghijklmnopqrstuvxwyz" : ""
        passowrdCharacters += useNumbers(numbers: numbers) == true ? "1234567890" : ""
        passowrdCharacters += useSpecialCharacters(specialCharacters: SpecialCharacters) == true ? "=-!@#$%^&*()-_,.?/" : ""
        passowrdCharacters += useCapitalLetters(capitalLetters: capitalLetters) == true ? "abcdefghijklmnopqrstuvxwyz".uppercased() : ""
        let passwordCharacteresArray = Array(passowrdCharacters)
        let numberOfPasswords = 1
        while passwords.count < numberOfPasswords {
            for _ in 1...numberfCharacters {
                let index = Int(arc4random_uniform(UInt32(passowrdCharacters.count)))
                password += String(passwordCharacteresArray[index])
            }
            passwords.append(password)
        }
        return password
    }
    
    /// Verifica se ao menos 1 switch está ativado, caso contrario ele não permitirá que a função generate seja chamada
    func checkingSwitchStatus(useCapitalLetters:Bool,useLowercase: Bool, useNumbers:Bool, useSpecialCharacters:Bool) -> Bool {
        var status = true
        if useCapitalLetters == false && useLowercase == false &&  useNumbers == false && useSpecialCharacters == false {
            status = false
        }
        return status
    }
    
}
