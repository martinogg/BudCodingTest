//
//  MockUIAlertController.swift
//  budTestAppTests
//
//  Created by martin ogg on 20/10/2018.
//  Copyright © 2018 martin ogg. All rights reserved.
//

import UIKit

class MockUIAlertController: UIAlertController {
    
    var dismissCalled: Bool = false
    
    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        
        self.dismissCalled = true
        completion?()
    }
}
