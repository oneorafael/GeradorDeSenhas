//
//  PasswordViewControllerTests.swift
//  GeradorDeSenhasTests
//
//  Created by Rafael Oliveira on 10/03/21.
//  Copyright © 2021 Rafael Oliveira. All rights reserved.
//

import XCTest
@testable import GeradorDeSenhas

class PasswordViewControllerTests: XCTestCase {

    var sut: PasswordViewController!
    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: "PasswordViewController") as? PasswordViewController
        
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
       sut = nil
    }
    
    func testPasswordViewController_WhenCreated_ShouldStartWithAllSwitchesOn() {
        XCTAssertTrue(sut.swLowercase.isOn, "swLowercase switch option should return True but return false")
        XCTAssertTrue(sut.swNumbers.isOn, "swNumbers switch option should return True but return false")
        XCTAssertTrue(sut.swCapitalLetters.isOn, "swCapitalLetters switch option should return True but return false")
        XCTAssertTrue(sut.swSpecialCharacteres.isOn, "swSpecialCharacteres switch option should return True but return false")
    }
    
    func testPasswordViewController_WhenCreated_PasswordTextFieldShouldBeEmpty() {
        XCTAssertEqual(sut.tfPasswordGenerated.text, "")
    }
    
    func testPasswordViewController_WhenCreated_HasGeneratePressedButtonAction() {
        // Arrange
        let generateButton: UIButton = try! XCTUnwrap(sut.generateButton, "generateButton does not reference outlet")
        // Action
        let generateButtonActions = try! XCTUnwrap(generateButton.actions(forTarget: sut, forControlEvent: .touchUpInside), "there's no action assigned to it")
        
        // Assert
        XCTAssertEqual(generateButtonActions.count, 1)
        XCTAssertEqual(generateButtonActions.first , "GenerateButtonHasPressed:", "Theres no action with this name")
    }
    
}
