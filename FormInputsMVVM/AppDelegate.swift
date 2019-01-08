//
//  AppDelegate.swift
//  FormInputsMVVM
//
//  Created by ShengHua Wu on 02/08/2017.
//  Copyright © 2017 ShengHua Wu. All rights reserved.
//

import UIKit
import Prelude

// MARK: - App Delegate
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    // MARK: Properties
    var window: UIWindow?
    private let router = Router()

    // MARK: Application Delegate
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        guard let formViewController = window?.rootViewController as? FormViewController else { return true }
        
        router.configure(formViewController)
        
        let c1 = Changeable(value: true)
        let c2 = c1.flatMap { bool in
            return Changeable(hasChanged: bool, value: "Oh my god")
        }
        print(c2.value)
        
        return true
    }
}

// MARK: - Router
struct Router {
    func configure(_ formViewController: FormViewController) {
        let viewModel = FormViewModel { [weak viewController = formViewController] (state) in
            viewController?.updateUI(state: state)
        }
        formViewController.viewModel = viewModel
    }
}
