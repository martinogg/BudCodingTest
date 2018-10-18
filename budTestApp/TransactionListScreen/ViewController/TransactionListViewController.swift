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
    
    @IBAction func refreshButtonPressed() {
        
        self.viewModel?.refreshButtonPressed()
    }
    
    func showLoadingScreen(_ show: Bool) {
        // TODO TEST
        
        if (show) {
            
            self.present(self.refreshingAlert, animated: true, completion: nil)
        } else {
                
            self.refreshingAlert.dismiss(animated: true, completion: nil)
        }
    }
    
    func showErrorMessage() {
        
        self.present(self.errorAlert, animated: true, completion: nil)
    }
    
    func update(elements: [TransactionListNetworkElement]) {
        
        // TODO!
    }
    
    lazy var refreshingAlert: UIAlertController = {
        
        return UIAlertController(title: "Refreshing", message: "Please wait", preferredStyle: .alert)
    }()
    
    lazy var errorAlert: UIAlertController = {
        
        let result = UIAlertController(title: "Error", message: "An Error Occurred", preferredStyle: .alert)
        result.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        
        return result
    }()
}
