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
    
    var transactionList: [TransactionListNetworkElement] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TransactionListRouter.attachTransactionListModule(to: self)
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    @IBAction func refreshButtonPressed() {
        
        self.viewModel?.refreshButtonPressed()
    }
    
    func showLoadingScreen(_ show: Bool, onComplete: (()->())?) {
        // TODO TEST
        
        if (show) {
            
            self.present(self.refreshingAlert, animated: true, completion: {
                
                onComplete?()
            })
        } else {
                
            self.refreshingAlert.dismiss(animated: true, completion: {
            
                onComplete?()
            })
        }
    }
    
    func showErrorMessage() {
        
        let alert = UIAlertController(title: "Error", message: "An Error Occurred", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func update(elements: [TransactionListNetworkElement]) {
        // TODO TEST
        self.transactionList = elements
        self.tableView.reloadData()
    }
    
    lazy var refreshingAlert: UIAlertController = {
        
        return UIAlertController(title: "Refreshing", message: "Please wait", preferredStyle: .alert)
    }()
}

extension TransactionListViewController { // UITableViewDelegate and datasource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.transactionList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let result = tableView.dequeueReusableCell(withIdentifier: "TransactionListCell")!
            
        if let transactionCell = result as? TransactionListCell {
            
            transactionCell.configure(with: self.transactionList[indexPath.row])
        }
        
        return result
    }
    
}
