//
//  FormData.swift
//  FormInputsMVVM
//
//  Created by ShengHua Wu on 02/08/2017.
//  Copyright © 2017 ShengHua Wu. All rights reserved.
//

import Foundation

struct FormData {
    static let empty = FormData(name: nil, email: nil, password: nil)
    
    let name: String?
    let email: String?
    let password: String?
}

extension FormData: Equatable {
    static func ==(lhs: FormData, rhs: FormData) -> Bool {
        return lhs.name == rhs.name && lhs.email == rhs.email && lhs.password == rhs.password
    }
}

extension FormData {
    var isValid: Bool {
        guard let name = name, !name.isEmpty else { return false }
        
        guard let email = email, !email.isEmpty else { return false }
        
        guard let password = password, !password.isEmpty else { return false }
        
        return true
    }
    
    private func changing(name: String) -> FormData {
        return FormData(name: name, email: email, password: password)
    }
    
    mutating func change(name: String) {
        self = changing(name: name)
    }
    
    private func changing(email: String) -> FormData {
        return FormData(name: name, email: email, password: password)
    }
    
    mutating func change(email: String) {
        self = changing(email: email)
    }
    
    private func changing(password: String) -> FormData {
        return FormData(name: name, email: email, password: password)
    }
    
    mutating func change(password: String) {
        self = changing(password: password)
    }
}
