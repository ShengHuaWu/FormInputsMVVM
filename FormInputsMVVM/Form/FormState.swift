//
//  FormState.swift
//  FormInputsMVVM
//
//  Created by ShengHua Wu on 02/08/2017.
//  Copyright © 2017 ShengHua Wu. All rights reserved.
//

import Foundation

struct FormState {
    var buttonIsEnabled: Bool
    var resultText: String?
    var formData: FormData {
        didSet {
            if resultText == "Too Many Attempts" {
                buttonIsEnabled = false
                return
            }
            
            if formData.isValid {
                buttonIsEnabled = true
            } else {
                buttonIsEnabled = false
            }
        }
    }
}

extension FormState: Equatable {
    static func ==(lhs: FormState, rhs: FormState) -> Bool {
        return lhs.buttonIsEnabled == rhs.buttonIsEnabled && lhs.resultText == rhs.resultText && lhs.formData == rhs.formData
    }
}
