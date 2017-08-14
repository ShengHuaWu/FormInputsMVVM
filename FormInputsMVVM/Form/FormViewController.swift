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
        submitButton.isEnabled = state.buttonIsEnabled
        
        guard let text = state.resultText else { return }
        
        let alert = UIAlertController(message: text)
        present(alert, animated: true, completion: nil)
    }
}

extension UIAlertController {
    convenience init(message: String) {
        self.init(title: nil, message: message, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        self.addAction(cancelAction)
    }
}
