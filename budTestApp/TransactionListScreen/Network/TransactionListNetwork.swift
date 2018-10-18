//
//  TransactionListNetwork.swift
//  budTestApp
//
//  Created by martin ogg on 18/10/2018.
//  Copyright © 2018 martin ogg. All rights reserved.
//

import Foundation

class TransactionListNetwork: TransactionListNetworkProtocol {
    
    func requestTransactionList(onComplete: @escaping (TransactionListNetworkResponse)->() ) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            // TODO Alamofire request
            
            onComplete( TransactionListNetworkResponse.success([TransactionListNetworkElement.init(name: "A"), TransactionListNetworkElement.init(name: "B"), TransactionListNetworkElement.init(name: "C")]) )
        }
    }
}
