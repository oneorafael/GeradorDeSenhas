//
//  PGenerator.swift
//  GeradorDeSenhas
//
//  Created by Rafael Oliveira on 05/07/18.
//  Copyright © 2018 Rafael Oliveira. All rights reserved.
//

import Foundation

class PGenerator {
    var numberOfCharacteres:Int
    var useLetters:Bool!
    var useNumbers:Bool!
    var useCapitalLetters:Bool
    var useSpecialCharacteres:Bool
    
    //opcões de caracteres
    var passwords:[String] = []
    var letters = "abcdefghijklmnopqrstuvxwyz"
    var specialCharacteres = "~`!@#$%*()_-+=|}]{[:;?/>.<,"
    var numbers = "1234567890"
    
    init(numberOfCharacteres:Int,useLetters:Bool,useNumbers:Bool,useCapitalLetters:Bool,useSpecialCharacteres:Bool) {
        
        //validação para ter ao menos 1 caracter e menos de 16 caracteres
        var numchars = min(numberOfCharacteres, 16)
        numchars = max(numchars, 1)
        
        self.numberOfCharacteres = numchars
        self.useLetters = useLetters
        self.useNumbers = useNumbers
        self.useCapitalLetters = useCapitalLetters
        self.useSpecialCharacteres = useSpecialCharacteres
        
    }
    
    func generate(total:Int) ->[String]{
        passwords.removeAll() //limpar a lista antes de criar novas opçoes de senhas
        var universe: String = ""
        if useSpecialCharacteres {
            universe += specialCharacteres
        }
        if useCapitalLetters {
            universe += letters.uppercased() //gerar letras maiusculas
        }
        if useLetters {
            universe += letters
        }
        if useNumbers {
            universe += numbers
        }
        
        let universeArray = Array(universe)
        while passwords.count < total {
            var password = ""
            for _ in 1...numberOfCharacteres{
                let index = Int(arc4random_uniform(UInt32(universe.count)))
                password += String(universeArray[index])
            }
            
            passwords.append(password)
        }
        return passwords
    }
    
    
    
}
