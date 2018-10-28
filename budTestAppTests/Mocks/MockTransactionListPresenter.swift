//
//  MockTransactionListPresenter.swift
//  budTestAppTests
//
//  Created by martin ogg on 28/10/2018.
//  Copyright © 2018 martin ogg. All rights reserved.
//

import Foundation
@testable import budTestApp

class MockTransactionListPresenter: TransactionListPresenterProtocol {
    
    weak var viewController: TransactionListViewControllerProtocol?
    var interactor: TransactionListInteractorProtocol?
    var router: TransactionListRouterProtocol?
    
    var refreshButtonPressedCallBack: (()->())?
    
    func refreshButtonPressed() {
        
        self.refreshButtonPressedCallBack?()
    }    
}
