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
    var passwordCharacters = ""
    var password = ""
    
    
    func useLowercase(lowercase:Bool) -> Bool {
        var returnValue = false
        if lowercase == true {
            passwordCharacters += "abcdefghijklmnopqrstuvxwyz"
            returnValue = true
        }
        return returnValue
    }
    
    func useNumbers(numbers:Bool) -> Bool {
        var returnValue = false
        if numbers == true {
            passwordCharacters += "1234567890"
            returnValue = true
        }
        return returnValue
    }
    
    func useSpecialCharacters(specialCharacters:Bool) -> Bool {
        var returnValue = false
        if specialCharacters == true {
            passwordCharacters += "=-!@#$%^&*()-_,.?/"
            returnValue = true
        }
        return returnValue
    }
    
    func useCapitalLetters(capitalLetters:Bool) -> Bool {
        var returnValue = false
        if capitalLetters == true {
            passwordCharacters += "abcdefghijklmnopqrstuvxwyz".uppercased()
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
    
    func generate(NumberOfCharacters:Int) -> String {
        // TODO: criar teste para isso
        passwords.removeAll()
        let passwordCharactersArray = Array(passwordCharacters)
        let numberOfPasswords = PasswordConstants.numberOfPasswords
        while passwords.count < numberOfPasswords {
            for _ in 1...NumberOfCharacters {
                let index = Int(arc4random_uniform(UInt32(passwordCharacters.count)))
                password += String(passwordCharactersArray[index])
            }
            passwords.append(password)
        }
        print("Senha gerada: \(password)")
        return password
    }
    
    /// Verifica se ao menos 1 switch está ativado, caso contrario ele não permitirá que a função generate seja chamada
    /// - Parameters:
    ///   - useCapitalLetters: Bool
    ///   - useLowercase: bool
    ///   - useNumbers: bool
    ///   - useSpecialCharacters: bool
    /// - Returns: bool
    func checkingSwitchStatus(useCapitalLetters:Bool,useLowercase: Bool, useNumbers:Bool, useSpecialCharacters:Bool) -> Bool {
//        TODO: Mudar para a ViewController essa verificação para disparar os alerts e notifications
        var status = true
        if useCapitalLetters == false && useLowercase == false &&  useNumbers == false && useSpecialCharacters == false {
            status = false
        }
        return status
    }
}
