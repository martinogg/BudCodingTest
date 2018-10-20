//
//  TransactionListCell.swift
//  budTestApp
//
//  Created by martin ogg on 18/10/2018.
//  Copyright © 2018 martin ogg. All rights reserved.
//

import UIKit

class TransactionListCell: UITableViewCell, TransactionListCellProtocol {
    var cacheService: TransactionListImageCacheProtocol?
    
    @IBOutlet var icon: UIImageView!
    @IBOutlet var name1: UILabel!
    @IBOutlet var name2: UILabel!
    @IBOutlet var price: UILabel!
    
    func configure(with element:TransactionListNetworkElement) {
        //TODO TEST
        
        self.icon.image = UIImage(named: "loading")
        
        if let iconURL = element.product?.icon {
            self.cacheService?.image(urlString: iconURL, onSucceed: { (image) in
                
                self.icon.image = image
            })
        }
        
        self.name1.text = element.description
        self.name2.text = element.product?.title
        let value = element.amount?.value ?? 0.0
        let currency = element.currency ?? ""
        self.price.text = "\(value) \(currency)"
    }
}
