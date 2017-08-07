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
    private(set) var state: FormState {
        didSet {
            callback(state)
        }
    }
    
    private let callback: (FormState) -> Void
    private var formData: FormData = .empty {
        didSet {
            if case .tooManyAttempts = state { return }
            
            if formData.isValid {
                state = .submitButtonIsEnabled(true)
            } else {
                state = .submitButtonIsEnabled(false)
            }
        }
    }
    private let tolerance = 3
    private var attempts = 0
    
    // MARK: Designated Initializer
    init(callback: @escaping (FormState) -> Void) {
        self.callback = callback
        self.state = .submitButtonIsEnabled(false)
    }
    
    // MARK: Public Methods
    func nameChanged(_ name: String?) {
        guard let name = name else { return }
        
        formData.change(name: name)
    }
    
    func emailChanged(_ email: String?) {
        guard let email = email else { return }
        
        formData.change(email: email)
    }
    
    func passwordChanged(_ password: String?) {
        guard let password = password else { return }
        
        formData.change(password: password)
    }
    
    func submitButtonPressed() {
        guard attempts < tolerance else {
            state = .tooManyAttempts
            return
        }
        
        if formData.isValid {
            state = .success
        } else {
            attempts += 1
            state = .failure
        }
    }
}
