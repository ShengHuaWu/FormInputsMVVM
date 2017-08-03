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
    func isValid() -> Bool {
        guard let name = name, !name.isEmpty else { return false }
        
        guard let email = email, !email.isEmpty else { return false }
        
        guard let password = password, !password.isEmpty else { return false }
        
        return true
    }
}
