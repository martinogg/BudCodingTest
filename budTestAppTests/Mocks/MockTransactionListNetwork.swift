//
//  MockTransactionListNetwork.swift
//  budTestAppTests
//
//  Created by martin ogg on 20/10/2018.
//  Copyright © 2018 martin ogg. All rights reserved.
//

import Foundation
@testable import budTestApp

class MockTransactionListNetwork: TransactionListNetworkProtocol {
    
    var requestTransactionListCallback: (()->())?
    var requestTransactionListToRespond: TransactionListNetworkResponse!
    
    func requestTransactionList(onComplete: @escaping (TransactionListNetworkResponse) -> ()) {
        
        self.requestTransactionListCallback?()
        onComplete(self.requestTransactionListToRespond)
    }
    
}
