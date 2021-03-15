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
    var passwordCharacteres = ""
    var password = ""
    
    
    func useLowercase(lowercase:Bool) -> Bool {
        var returnValue = false
        if lowercase == true {
            passwordCharacteres += "abcdefghijklmnopqrstuvxwyz"
            returnValue = true
        }
        return returnValue
    }
    
    func useNumbers(numbers:Bool) -> Bool {
        var returnValue = false
        if numbers == true {
            passwordCharacteres += "1234567890"
            returnValue = true
        }
        return returnValue
    }
    
    func useSpecialCharacters(specialCharacters:Bool) -> Bool {
        var returnValue = false
        if specialCharacters == true {
            passwordCharacteres += "=-!@#$%^&*()-_,.?/"
            returnValue = true
        }
        return returnValue
    }
    
    func useCapitalLetters(capitalLetters:Bool) -> Bool {
        var returnValue = false
        if capitalLetters == true {
            passwordCharacteres += "abcdefghijklmnopqrstuvxwyz".uppercased()
            returnValue = true
        }
        return returnValue
    }
    
    func NumberOfCharactersIsValid(number:Int) -> Bool {
        var itsSecurityPassword = true
        if number < PasswordConstants.numberOfCharacters_min {
            itsSecurityPassword = false
        }
        return itsSecurityPassword
    }
    
    func generate(NumberOfCharacteres:Int) -> String {
        passwords.removeAll()
        let passwordCharacteresArray = Array(passwordCharacteres)
        let numberOfPasswords = PasswordConstants.numberOfPasswords
        while passwords.count < numberOfPasswords {
            for _ in 1...NumberOfCharacteres {
                let index = Int(arc4random_uniform(UInt32(passwordCharacteres.count)))
                password += String(passwordCharacteresArray[index])
            }
            passwords.append(password)
        }

        return password
    }
    
    /// Verifica se ao menos 1 switch está ativado, caso contrario ele não permitirá que a função generate seja chamada
    /// - Parameters:
    ///   - useCapitalLetters: Bool
    ///   - useLowercase: bool
    ///   - useNumbers: bool
    ///   - useSpecialCharacteres: bool
    /// - Returns: bool
    func checkingSwitchStatus(useCapitalLetters:Bool,useLowercase: Bool, useNumbers:Bool, useSpecialCharacteres:Bool) -> Bool {
//        TODO: Mudar para a ViewController essa verificação para disparar os alerts e notifications
        var status = true
        if useCapitalLetters == false && useLowercase == false &&  useNumbers == false && useSpecialCharacteres == false {
            status = false
        }
        return status
    }
}
