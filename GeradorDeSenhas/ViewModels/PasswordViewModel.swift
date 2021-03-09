//
//  PasswordViewModel.swift
//  GeradorDeSenhas
//
//  Created by Rafael Oliveira on 09/03/21.
//  Copyright © 2021 Rafael Oliveira. All rights reserved.
//

import Foundation

class PasswordViewModel {
    
    var password: Password!
    var passwordGenerated: String {return password.passwordGenerated}
    var passwords:[String] = []
    
    /// Verifica que tipo de valores o usuario quer que a senha possua de acordo com a disposição dos UIswitch da ViewController.
    /// Gera a senha pegando valores contidos no passwordCharacteres
    /// - Parameters:
    ///   - NumberOfCharacteres: default 8. Usuario pode alterar entre 1 e 30
    ///   - useCapitalLetters: Bool
    ///   - useLowercase: Bool
    ///   - useNumbers: Bool
    ///   - useSpecialCharacteres:  Bool
    /// - Returns: String password
    func generate(NumberOfCharacteres:Int,useCapitalLetters:Bool,useLowercase: Bool, useNumbers:Bool, useSpecialCharacteres:Bool) -> String {
        passwords.removeAll()
        var passwordCharacteres = ""
        var password = ""
        
        if useLowercase {
            passwordCharacteres += "abcdefghijklmnopqrstuvxwyz"
        }
        if useNumbers {
            passwordCharacteres += "1234567890"
        }
        if useSpecialCharacteres {
            passwordCharacteres += "=-!@#$%^&*()-_,.?/"
        }
        if useCapitalLetters {
            passwordCharacteres += "abcdefghijklmnopqrstuvxwyz".uppercased()
        }
        
        let passwordCharacteresArray = Array(passwordCharacteres)
        let numberOfPasswords = 1
        while passwords.count < numberOfPasswords {
            for _ in 1...NumberOfCharacteres {
                let index = Int(arc4random_uniform(UInt32(passwordCharacteres.count)))
                password += String(passwordCharacteresArray[index])
            }
            passwords.append(password)
        }

        return password
    }
}
