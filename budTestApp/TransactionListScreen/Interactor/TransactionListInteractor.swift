//
//  TransactionListInteractor.swift
//  budTestApp
//
//  Created by martin ogg on 28/10/2018.
//  Copyright © 2018 martin ogg. All rights reserved.
//

import Foundation

class TransactionListInteractor: TransactionListInteractorProtocol {
    var dataManager: TransactionListDataManagerProtocol?
    weak var presenter: TransactionListPresenterProtocol?

    func requestTransactionList(onComplete: @escaping (TransactionListNetworkResponse) -> ()) {
        
        self.dataManager?.requestTransactionList(onComplete: onComplete)
    }
    
}
