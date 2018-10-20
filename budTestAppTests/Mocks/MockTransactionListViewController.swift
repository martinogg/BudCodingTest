//
//  MockTransactionListViewController.swift
//  budTestAppTests
//
//  Created by martin ogg on 20/10/2018.
//  Copyright © 2018 martin ogg. All rights reserved.
//

import Foundation
@testable import budTestApp

class MockTransactionListViewController: TransactionListViewControllerProtocol {
    var viewModel: TransactionListViewModelProtocol?
    
    var showLoadingScreenCallback: (()->())?
    var hideLoadingScreenCallback: (()->())?
    var showErrorMessageCallback: (()->())?
    var updateCallback: (([TransactionListNetworkElement])->())?
    
    func showLoadingScreen(onComplete: (() -> ())?) {
        
        self.showLoadingScreenCallback?()
        onComplete?()
    }
    
    func hideLoadingScreen(onComplete: (() -> ())?) {
        
        self.hideLoadingScreenCallback?()
        onComplete?()
    }
    
    func showErrorMessage() {
        self.showErrorMessageCallback?()
    }
    
    func update(elements: [TransactionListNetworkElement]) {
        
        self.updateCallback?(elements)
    }
}
