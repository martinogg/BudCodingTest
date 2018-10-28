//
//  TransactionListViewController.swift
//  budTestApp
//
//  Created by martin ogg on 18/10/2018.
//  Copyright © 2018 martin ogg. All rights reserved.
//

import UIKit

class TransactionListViewController: UITableViewController, TransactionListViewControllerProtocol {
    var presenter: TransactionListPresenterProtocol?
    
    @IBOutlet var refreshButton: UIButton!
    
    var transactionList: [TransactionListNetworkElement] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TransactionListRouter.attachTransactionListModule(to: self)
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    @IBAction func refreshButtonPressed() {
        
        self.presenter?.refreshButtonPressed()
    }
    
    func showLoadingScreen(onComplete: (()->())?) {
        
        self.present(self.refreshingAlert, animated: false, completion: {
            
            onComplete?()
        })
    }
    
    func hideLoadingScreen(onComplete: (()->())?) {

        self.refreshingAlert.dismiss(animated: true, completion: {
            
            onComplete?()
        })
    }
    
    func showErrorMessage() {
        
        let alert = UIAlertController(title: NSLocalizedString("Error", comment: ""), message: NSLocalizedString("An Error Occurred", comment: ""), preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func update(elements: [TransactionListNetworkElement]) {

        self.transactionList = elements
        self.tableView.reloadData()
    }
    
    lazy var refreshingAlert: UIAlertController = {
        
        return UIAlertController(title: NSLocalizedString("Refreshing", comment: ""), message: NSLocalizedString("Please wait", comment: ""), preferredStyle: .alert)
    }()
}

extension TransactionListViewController { // UITableViewDelegate and datasource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.transactionList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let result = tableView.dequeueReusableCell(withIdentifier: "TransactionListCell")!
            
        if let transactionCell = result as? TransactionListCell {
            
            transactionCell.cacheService = self.presenter?.interactor?.dataManager?.imageCache
            transactionCell.configure(with: self.transactionList[indexPath.row])
        }
        
        return result
    }
    
}

