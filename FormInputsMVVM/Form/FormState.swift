//
//  FormState.swift
//  FormInputsMVVM
//
//  Created by ShengHua Wu on 02/08/2017.
//  Copyright © 2017 ShengHua Wu. All rights reserved.
//

import Foundation

struct FormState {
    var submitButtonIsEnabled: Bool
    var resultText: String?
    var formData: FormData {
        didSet {
            if resultText == "Too Many Attempts" {
                submitButtonIsEnabled = false
                return
            }
            
            if !formData.isEmpty {
                submitButtonIsEnabled = true
            } else {
                submitButtonIsEnabled = false
            }
        }
    }
}

extension FormState: Equatable {
    static func ==(lhs: FormState, rhs: FormState) -> Bool {
        return lhs.submitButtonIsEnabled == rhs.submitButtonIsEnabled && lhs.resultText == rhs.resultText && lhs.formData == rhs.formData
    }
}
