//
//  TransactionListViewController.swift
//  budTestApp
//
//  Created by martin ogg on 18/10/2018.
//  Copyright © 2018 martin ogg. All rights reserved.
//

import UIKit

class TransactionListViewController: UITableViewController, TransactionListViewControllerProtocol {
    var viewModel: TransactionListViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TransactionListRouter.attachTransactionListModule(to: self)
    }
    
    
}
