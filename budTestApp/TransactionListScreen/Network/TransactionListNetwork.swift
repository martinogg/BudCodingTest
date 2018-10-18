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

class TransactionListNetwork: TransactionListNetworkProtocol {
    
    func requestTransactionList(onComplete: @escaping (TransactionListNetworkResponse)->() ) {
        
        let URL = "https://www.mocky.io/v2/5b33bdb43200008f0ad1e256"
        Alamofire.request(URL).responseArray { (response: DataResponse<[TransactionListNetworkElement]>) in
            
            guard let successResponse = response.result.value else {
                
                onComplete(.error)
                return
            }
            
            onComplete(.success(successResponse))
        }
    }
}
