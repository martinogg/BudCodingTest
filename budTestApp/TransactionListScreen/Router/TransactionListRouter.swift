//
//  TransactionListRouter.swift
//  budTestApp
//
//  Created by martin ogg on 18/10/2018.
//  Copyright © 2018 martin ogg. All rights reserved.
//

import Foundation

class TransactionListRouter: TransactionListRouterProtocol {
    
    static func attachTransactionListModule(to transactionViewController: TransactionListViewControllerProtocol) {
        
        let viewModel = TransactionListViewModel()
        let router = TransactionListRouter()
        let network = TransactionListNetwork()
        let imageCache = TransactionListImageCache()
        
        viewModel.viewController = transactionViewController
        viewModel.router = router
        viewModel.network = network
        viewModel.imageCache = imageCache
        transactionViewController.viewModel = viewModel        
    }
}
