//
//  FormState.swift
//  FormInputsMVVM
//
//  Created by ShengHua Wu on 02/08/2017.
//  Copyright © 2017 ShengHua Wu. All rights reserved.
//

import Foundation

enum FormState {
    case normal(FormData)
    case success
    case failure
    case tooManyAttempts
}

extension FormState: Equatable {
    static func ==(lhs: FormState, rhs: FormState) -> Bool {
        switch (lhs, rhs) {
        case let (.normal(left), .normal(right)): return left == right
        case (.success, .success): return true
        case (.failure, .failure): return true
        case (.tooManyAttempts, .tooManyAttempts): return true
        default: return false
        }
    }
}

extension FormState {
    private func changing(name: String) -> FormState {
        switch self {
        case let .normal(formData):
            return .normal(FormData(name: name, email: formData.email, password: formData.password))
        default:
            return self
        }
    }
    
    mutating func change(name: String) {
        self = changing(name: name)
    }
    
    private func changing(email: String) -> FormState {
        switch self {
        case let .normal(formData):
            return .normal(FormData(name: formData.name, email: email, password: formData.password))
        default:
            return self
        }
    }
    
    mutating func change(email: String) {
        self = changing(email: email)
    }
    
    private func changing(password: String) -> FormState {
        switch self {
        case let .normal(formData):
            return .normal(FormData(name: formData.name, email: formData.email, password: password))
        default:
            return self
        }
    }
    
    mutating func change(password: String) {
        self = changing(password: password)
    }
    
    func isValid() -> Bool {
        switch self {
        case let .normal(formData): return formData.isValid()
        default: return false
        }
    }
}
