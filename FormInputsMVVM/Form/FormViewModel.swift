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
    var state: FormState = .normal(.empty)
    
    // MARK: Public Methods
    func nameChanged(_ name: String?) {
        guard let name = name else { return }
        
        state.change(name: name)
    }
    
    func emailChanged(_ email: String?) {
        guard let email = email else { return }
        
        state.change(email: email)
    }
    
    func passwordChanged(_ password: String?) {
        guard let password = password else { return }
        
        state.change(password: password)
    }
    
    func submitButtonPressed() {
        if state.isValid() {
            state = .success
        } else {
            state = .failure
        }
    }
}
