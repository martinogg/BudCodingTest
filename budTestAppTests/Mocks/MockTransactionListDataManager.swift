//
//  MockTransactionListDataManager.swift
//  budTestAppTests
//
//  Created by martin ogg on 28/10/2018.
//  Copyright © 2018 martin ogg. All rights reserved.
//

import UIKit
@testable import budTestApp

class MockTransactionListDataManager: TransactionListDataManagerProtocol {
    
    var network: TransactionListNetworkProtocol?
    var imageCache: TransactionListImageCacheProtocol?
    
    var requestTransactionListCallback:(()->())?
    var imageCallback:(()->())?
    
    func requestTransactionList(onComplete: @escaping (TransactionListNetworkResponse) -> ()) {
        
        self.requestTransactionListCallback?()
    }
    
    func image(urlString: String, onSucceed: @escaping (UIImage) -> ()) {
        
        self.imageCallback?()
    }
}
