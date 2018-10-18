//
//  MockTransactionListViewModel.swift
//  budTestAppTests
//
//  Created by martin ogg on 18/10/2018.
//  Copyright © 2018 martin ogg. All rights reserved.
//

import Foundation
@testable import budTestApp

class MockTransactionListViewModel: TransactionListViewModelProtocol {
    var imageCache: TransactionListImageCacheProtocol?
    weak var viewController: TransactionListViewControllerProtocol?
    var router: TransactionListRouterProtocol?
    var network: TransactionListNetworkProtocol?
    
    var refreshButtonPressedCallBack: (()->())?
    
    func refreshButtonPressed() {
        
        self.refreshButtonPressedCallBack?()
    }
}
