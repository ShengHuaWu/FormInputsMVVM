//
//  FormViewModel.swift
//  FormInputsMVVM
//
//  Created by ShengHua Wu on 02/08/2017.
//  Copyright © 2017 ShengHua Wu. All rights reserved.
//

import Foundation

final class FormViewModel {
    // MARK: Properties
    private(set) var state: FormState = FormState(buttonIsEnabled: false, resultText: nil, formData: .empty) {
        didSet {
            callback(state)
        }
    }
    
    private let callback: (FormState) -> Void
    private let tolerance = 3
    private var attempts = 0
    
    // MARK: Designated Initializer
    init(callback: @escaping (FormState) -> Void) {
        self.callback = callback
    }
    
    // MARK: Public Methods
    func nameChanged(_ name: String?) {
        guard let name = name else { return }
        
        state.formData.change(name: name)
    }
    
    func emailChanged(_ email: String?) {
        guard let email = email else { return }
        
        state.formData.change(email: email)
    }
    
    func passwordChanged(_ password: String?) {
        guard let password = password else { return }
        
        state.formData.change(password: password)
    }
    
    func submitButtonPressed() {
        guard attempts < tolerance else {
            state.resultText = "Too Many Attempts"
            return
        }
        
        if state.formData.isValid {
            state.resultText = "Success"
        } else {
            attempts += 1
            state.resultText = "Failure"
        }
    }
}
