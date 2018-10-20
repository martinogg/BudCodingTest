//
//  OverrideTransationListViewController.swift
//  budTestAppTests
//
//  Created by martin ogg on 20/10/2018.
//  Copyright © 2018 martin ogg. All rights reserved.
//

import UIKit
@testable import budTestApp

class OverrideTransationListViewController: TransactionListViewController {

    var presentFuncCallback: ((UIViewController, Bool, (() -> ())?) -> ())?
    
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        
        presentFuncCallback?(viewControllerToPresent, flag, completion)
        completion?()
    }
    
}
