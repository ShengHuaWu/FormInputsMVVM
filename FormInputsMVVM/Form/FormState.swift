//
//  FormState.swift
//  FormInputsMVVM
//
//  Created by ShengHua Wu on 02/08/2017.
//  Copyright © 2017 ShengHua Wu. All rights reserved.
//

import Foundation

enum FormState {
    case submitButtonIsEnabled(Bool)
    case success
    case failure
    case tooManyAttempts
}

extension FormState: Equatable {
    static func ==(lhs: FormState, rhs: FormState) -> Bool {
        switch (lhs, rhs) {
        case let (.submitButtonIsEnabled(left), .submitButtonIsEnabled(right)): return left == right
        case (.success, .success): return true
        case (.failure, .failure): return true
        case (.tooManyAttempts, .tooManyAttempts): return true
        default: return false
        }
    }
}
