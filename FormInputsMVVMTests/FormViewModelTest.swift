//
//  FormViewModelTest.swift
//  FormInputsMVVM
//
//  Created by ShengHua Wu on 02/08/2017.
//  Copyright © 2017 ShengHua Wu. All rights reserved.
//

import XCTest
@testable import FormInputsMVVM

class FormViewModelTest: XCTestCase {
    // MARK: Properties
    var viewModel: FormViewModel!
    
    // MARK: Override Methods
    override func setUp() {
        super.setUp()
        
        viewModel = FormViewModel{ _ in }
    }
    
    override func tearDown() {
        super.tearDown()
        
        viewModel = nil
    }
    
    // MARK: Enabled Tests
    func testInputsSuccess() {
        viewModel.nameChanged("shane")
        
        XCTAssert(viewModel.state.buttonIsEnabled == false)
        
        viewModel.emailChanged("shane@gmail.com")
        
        XCTAssert(viewModel.state.buttonIsEnabled == false)
        
        viewModel.passwordChanged("thisismypassword1234")
        
        XCTAssert(viewModel.state.buttonIsEnabled == true)
        
        viewModel.submitButtonPressed()
        
        XCTAssert(viewModel.state.resultText == "Success")
    }
    
    func testInputsFailure() {
        viewModel.nameChanged("shane")
        
        XCTAssert(viewModel.state.buttonIsEnabled == false)
        
        viewModel.emailChanged("shane@gmail.com")
        
        XCTAssert(viewModel.state.buttonIsEnabled == false)
        
        viewModel.passwordChanged("thisismypassword1234")
        
        XCTAssert(viewModel.state.buttonIsEnabled == true)
        
        viewModel.passwordChanged("")
        
        XCTAssert(viewModel.state.buttonIsEnabled == false)
        
        viewModel.submitButtonPressed()
        
        XCTAssert(viewModel.state.resultText == "Failure")
    }
    
    func testFailureThenSuccess() {
        viewModel.submitButtonPressed()

        XCTAssert(viewModel.state.resultText == "Failure")

        viewModel.nameChanged("shane")
        
        XCTAssert(viewModel.state.buttonIsEnabled == false)
        
        viewModel.emailChanged("shane@gmail.com")
        
        XCTAssert(viewModel.state.buttonIsEnabled == false)
        
        viewModel.passwordChanged("thisismypassword1234")
        
        XCTAssert(viewModel.state.buttonIsEnabled == true)
        
        viewModel.submitButtonPressed()
        
        XCTAssert(viewModel.state.resultText == "Success")
    }
    
    func testTooMayAttempts() {
        viewModel.submitButtonPressed()
        viewModel.submitButtonPressed()
        viewModel.submitButtonPressed()
        viewModel.submitButtonPressed()
        
        XCTAssert(viewModel.state.resultText == "Too Many Attempts")
        
        viewModel.nameChanged("shane")
        
        XCTAssert(viewModel.state.resultText == "Too Many Attempts")
        XCTAssert(viewModel.state.buttonIsEnabled == false)
    }
}
