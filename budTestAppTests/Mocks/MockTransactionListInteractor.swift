//
//  MockTransactionListInteractor.swift
//  budTestAppTests
//
//  Created by martin ogg on 28/10/2018.
//  Copyright © 2018 martin ogg. All rights reserved.
//

import Foundation
@testable import budTestApp

class MockTransactionListInteractor: TransactionListInteractorProtocol {
    var dataManager: TransactionListDataManagerProtocol?
    var presenter: TransactionListPresenterProtocol?
    
    var requestTransactionListCallback: (()->())?
    var requestTransactionListToRespond: TransactionListNetworkResponse?
    
    func requestTransactionList(onComplete: @escaping (TransactionListNetworkResponse) -> ()) {
        
        self.requestTransactionListCallback?()
        onComplete(self.requestTransactionListToRespond!)
    }
}
