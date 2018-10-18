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
    
    func configure(with element:TransactionListNetworkElement) {
        
        self.icon.image = UIImage(named: "loading")
        
        if let iconURL = element.product?.icon {
            self.cacheService?.image(urlString: iconURL, onSucceed: { (image) in
                
                self.icon.image = image
            })
        }
    }
}
