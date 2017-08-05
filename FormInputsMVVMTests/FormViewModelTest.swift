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
        
        XCTAssert(viewModel.state == .normal(FormData(name: "shane", email: nil, password: nil)))
        
        viewModel.emailChanged("shane@gmail.com")
        
        XCTAssert(viewModel.state == .normal(FormData(name: "shane", email: "shane@gmail.com", password: nil)))
        
        viewModel.passwordChanged("thisismypassword1234")
        
        XCTAssert(viewModel.state == .normal(FormData(name: "shane", email: "shane@gmail.com", password: "thisismypassword1234")))
        
        viewModel.submitButtonPressed()
        
        XCTAssert(viewModel.state == .success)
    }
    
    func testInputsFailure() {
        viewModel.nameChanged("shane")
        
        XCTAssert(viewModel.state == .normal(FormData(name: "shane", email: nil, password: nil)))
        
        viewModel.emailChanged("shane@gmail.com")
        
        XCTAssert(viewModel.state == .normal(FormData(name: "shane", email: "shane@gmail.com", password: nil)))
        
        viewModel.passwordChanged("thisismypassword1234")
        
        XCTAssert(viewModel.state == .normal(FormData(name: "shane", email: "shane@gmail.com", password: "thisismypassword1234")))
        
        viewModel.passwordChanged("")
        
        XCTAssert(viewModel.state == .normal(FormData(name: "shane", email: "shane@gmail.com", password: "")))
        
        viewModel.submitButtonPressed()
        
        XCTAssert(viewModel.state == .failure)
    }
    
    func testTooMayAttempts() {
        viewModel.submitButtonPressed()
        viewModel.submitButtonPressed()
        viewModel.submitButtonPressed()
        viewModel.submitButtonPressed()
        
        XCTAssert(viewModel.state == .tooManyAttempts)
    }
}
