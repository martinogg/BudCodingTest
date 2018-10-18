//
//  TransactionListNetwork.swift
//  budTestApp
//
//  Created by martin ogg on 18/10/2018.
//  Copyright © 2018 martin ogg. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

let URL = "https://www.mocky.io/v2/5b33bdb43200008f0ad1e256" // Hard coded URLs FTW

class TransactionListNetwork: TransactionListNetworkProtocol {
    
    func requestTransactionList(onComplete: @escaping (TransactionListNetworkResponse)->() ) {
        
        Alamofire.request(URL).responseObject { (response: DataResponse<TransactionAmountData>) in
            
            guard let successResponse = response.result.value,
                let responseArray = successResponse.data else {
                
                onComplete(.error)
                return
            }
            
            onComplete(.success(responseArray))
        }
    }
}
