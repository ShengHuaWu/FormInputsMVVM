//
//  FormViewController.swift
//  FormInputsMVVM
//
//  Created by ShengHua Wu on 02/08/2017.
//  Copyright © 2017 ShengHua Wu. All rights reserved.
//

import UIKit

final class FormViewController: UIViewController {
    // MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    var viewModel: FormViewModel?
    
    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Actions
    @IBAction func nameChanged(_ sender: UITextField) {
        viewModel?.nameChanged(sender.text)
    }
    
    @IBAction func emailChanged(_ sender: UITextField) {
        viewModel?.emailChanged(sender.text)
    }
    
    @IBAction func passwordChanged(_ sender: UITextField) {
        viewModel?.passwordChanged(sender.text)
    }
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        viewModel?.submitButtonPressed()
    }
    
    // MARK: Public Methods
    func updateUI(state: FormState) {
        switch state {
        case let .submitButtonIsEnabled(enabled):
            submitButton.isEnabled = enabled
        case .success:
            print("Successful")
        case .failure:
            print("Failure")
        case .tooManyAttempts:
            print("Too many attempts")
        }
    }
}
