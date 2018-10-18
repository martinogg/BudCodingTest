//
//  TransactionListProtocols.swift
//  budTestApp
//
//  Created by martin ogg on 18/10/2018.
//  Copyright © 2018 martin ogg. All rights reserved.
//

import UIKit

protocol TransactionListViewControllerProtocol: class {
    
    var viewModel: TransactionListViewModelProtocol? {get set}
    
    func showLoadingScreen(_ show: Bool, onComplete: (()->())?)
    func showErrorMessage()
    func update(elements: [TransactionListNetworkElement])
}

protocol TransactionListViewModelProtocol: class {
    
    var viewController: TransactionListViewControllerProtocol? {get set}
    var router: TransactionListRouterProtocol? {get set}
    var network: TransactionListNetworkProtocol? {get set}
    var imageCache: TransactionListImageCacheProtocol? {get set}
    
    func refreshButtonPressed()
}

protocol TransactionListRouterProtocol: class {
    
}

protocol TransactionListNetworkProtocol: class {
    
    func requestTransactionList(onComplete: @escaping (TransactionListNetworkResponse)->())
}

protocol TransactionListImageCacheProtocol: class {
    
    func image(urlString: String, onSucceed: @escaping (UIImage)->())
}

protocol TransactionListCellProtocol: class {
    
    var cacheService: TransactionListImageCacheProtocol? {get set}
    
    func configure(with element:TransactionListNetworkElement)
}
