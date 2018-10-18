//
//  TransactionListProtocols.swift
//  budTestApp
//
//  Created by martin ogg on 18/10/2018.
//  Copyright © 2018 martin ogg. All rights reserved.
//

import Foundation

protocol TransactionListViewControllerProtocol: class {
    
    var viewModel: TransactionListViewModelProtocol? {get set}
    
}

protocol TransactionListViewModelProtocol: class {
    
    var viewController: TransactionListViewControllerProtocol? {get set}
    var router: TransactionListRouterProtocol? {get set}
}

protocol TransactionListRouterProtocol: class {
    
    
}
