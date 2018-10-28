//
//  TransactionListRouter.swift
//  budTestApp
//
//  Created by martin ogg on 18/10/2018.
//  Copyright © 2018 martin ogg. All rights reserved.
//

import Foundation
import AlamofireImage

class TransactionListRouter: TransactionListRouterProtocol {
    
    static func attachTransactionListModule(to transactionViewController: TransactionListViewControllerProtocol) {
        
        let router = TransactionListRouter()
        let presenter = TransactionListPresenter()
        let interactor = TransactionListInteractor()
        
        let network = TransactionListNetwork()
        let imageCache = TransactionListImageCache(imageCache: AutoPurgingImageCache())
        let dataManager = TransactionListDataManager()
        
        dataManager.network = network
        dataManager.imageCache = imageCache
        interactor.dataManager = dataManager
        interactor.presenter = presenter
        presenter.router = router
        presenter.interactor = interactor
        presenter.viewController = transactionViewController
        transactionViewController.presenter = presenter
        
    }
}
