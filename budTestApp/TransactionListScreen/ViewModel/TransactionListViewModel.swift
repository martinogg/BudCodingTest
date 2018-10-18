//
//  TransactionListViewModel.swift
//  budTestApp
//
//  Created by martin ogg on 18/10/2018.
//  Copyright © 2018 martin ogg. All rights reserved.
//

import Foundation

class TransactionListViewModel: TransactionListViewModelProtocol {
    
    var router: TransactionListRouterProtocol?
    weak var viewController: TransactionListViewControllerProtocol?
    var network: TransactionListNetworkProtocol?
    
    func refreshButtonPressed() {
        // TODO TEST
        
        self.viewController?.showLoadingScreen(true, onComplete: nil)
        self.network?.requestTransactionList(onComplete: { [unowned self] (response) in
            
            self.viewController?.showLoadingScreen(false, onComplete: {
                
                switch (response) {
                case .error:
                    
                    self.viewController?.showErrorMessage()
                case .success(let elements):
                    
                    self.viewController?.update(elements: elements)
                }
            })
        })
    }
}
