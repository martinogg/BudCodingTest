//
//  TransactionListPresenter.swift
//  budTestApp
//
//  Created by martin ogg on 28/10/2018.
//  Copyright © 2018 martin ogg. All rights reserved.
//

import Foundation

class TransactionListPresenter: TransactionListPresenterProtocol {
    
    weak var viewController: TransactionListViewControllerProtocol?
    var interactor: TransactionListInteractorProtocol?
    var router: TransactionListRouterProtocol?
    
    func refreshButtonPressed() {
        
        self.viewController?.showLoadingScreen(onComplete: nil)
        self.interactor?.requestTransactionList(onComplete: { [unowned self] (response) in
            
            self.viewController?.hideLoadingScreen(onComplete: {
                
                self.handleRequestResponse(response: response)
            })
        })
    }
    
    func handleRequestResponse(response: TransactionListNetworkResponse) {
        
        switch (response) {
        case .error:
            
            self.viewController?.showErrorMessage()
        case .success(let elements):
            
            self.viewController?.update(elements: elements)
        }
    }
}
