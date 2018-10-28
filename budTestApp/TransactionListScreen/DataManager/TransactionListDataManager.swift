//
//  TransactionListDataManager.swift
//  budTestApp
//
//  Created by martin ogg on 28/10/2018.
//  Copyright © 2018 martin ogg. All rights reserved.
//

import UIKit

class TransactionListDataManager: TransactionListDataManagerProtocol {
    
    var network: TransactionListNetworkProtocol?
    var imageCache: TransactionListImageCacheProtocol?

    func requestTransactionList(onComplete: @escaping (TransactionListNetworkResponse) -> ()) {
        // TODO TEST
        
        self.network?.requestTransactionList(onComplete: onComplete)
    }
    
    func image(urlString: String, onSucceed: @escaping (UIImage) -> ()) {
        // TODO TEST
        
        self.imageCache?.image(urlString: urlString, onSucceed: onSucceed)
    }
}
