//
//  FormState.swift
//  FormInputsMVVM
//
//  Created by ShengHua Wu on 02/08/2017.
//  Copyright © 2017 ShengHua Wu. All rights reserved.
//

import Foundation

enum FormState {
    case success(String)
    case failure(String)
    case viewDidLoad
    case tooManyAttempts(String)
}
