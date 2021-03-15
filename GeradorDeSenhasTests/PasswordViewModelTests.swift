//
//  PasswordViewModelTests.swift
//  GeradorDeSenhasTests
//
//  Created by Rafael Oliveira on 15/03/21.
//  Copyright © 2021 Rafael Oliveira. All rights reserved.
//

import XCTest
@testable import GeradorDeSenhas

class PasswordViewModelTests: XCTestCase {
    
    var sut: PasswordViewModel!
    
    override func setUp() {
        sut = PasswordViewModel()
        
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func testPasswordViewModel_WhenUseLowercaseOption_ShouldReturnTrue() {
        // Act
        sut = PasswordViewModel()
        
        // Arrange
        let useLowercaseOption = sut.useLowercase(lowercase: true)
        // Assert
        XCTAssertTrue(useLowercaseOption,"useLowercaseOption() method should return true but return false")
    }
    func testPasswordViewModel_WhenDontUseLowercaseOption_ShouldReturnFalse() {
        // Act
        // Arrange
        let useLowercaseOption = sut.useLowercase(lowercase: false)
        // Assert
        XCTAssertFalse(useLowercaseOption, "useLowercaseOption() method should return false but return true")
    }
    
    func testPasswordViewModel_WhenUseNumbers_ShouldReturnTrue() {
        // Act
        let useNumbersOption = sut.useNumbers(numbers:true)
        // Arrange
        XCTAssertTrue(useNumbersOption, "useNumbers() method should return true but return false")
        // Assert
        
    }
    
    func testPasswordViewModel_WhenDontUseNumbers_ShouldReturnFalse() {
        // Act
        // Arrange
        let useNumbersOption = sut.useNumbers(numbers:false)
        // Assert
        XCTAssertFalse(useNumbersOption, "useNumbers() method should return false but return true")

    }
    
    func testPasswordViewModel_WhenUseSpecialCharacters_ShouldReturnTrue() {
        // Act
        // Arrange
        let useSpecialCharacters = sut.useSpecialCharacters(specialCharacters:true)
        // Assert
        XCTAssertTrue(useSpecialCharacters, "useSpecialCharacters() method should return true but return false")
    }
    func testPasswordViewModel_WhenDontUseSpecialCharacters_ShouldReturnFalse() {
        // Act
        // Arrange
        let useSpecialCharacters = sut.useSpecialCharacters(specialCharacters:false)
        // Assert
        XCTAssertFalse(useSpecialCharacters, "useSpecialCharacters() method should return false but return true")
    }
    
    func testPasswordViewModel_WhenUseCapitalLetters_ShouldReturnTrue() {
        // Act
        // Arrange
        let useCapitalLetters = sut.useCapitalLetters(capitalLetters:true)
        // Assert
        XCTAssertTrue(useCapitalLetters, "useCapitalLetters() method should return true but return false")
    }
    
    func testPasswordViewModel_WhenDontUseCapitalLetters_ShouldReturnFalse() {
        // Act
        // Arrange
        let useCapitalLetters = sut.useCapitalLetters(capitalLetters:true)
        // Assert
        XCTAssertTrue(useCapitalLetters, "useCapitalLetters() method should return false but return true")
    }
    
    func testPasswordViewModel_WhenNumberOfCaractersIsValid_shouldReturnTrue(){
        // Act
        // Arrange
        let NumberOfCharacters = sut.NumberOfCharactersIsValid(number: 8)
        // Assert
        XCTAssertTrue(NumberOfCharacters)
    }
    
    func testPasswordViewModel_WhenNumberOfCaractersIsInvalid_shouldReturnFalse(){
        // Act
        // Arrange
        let NumberOfCharacters = sut.NumberOfCharactersIsValid(number: 2)
        // Assert
        XCTAssertFalse(NumberOfCharacters)
    }
}
