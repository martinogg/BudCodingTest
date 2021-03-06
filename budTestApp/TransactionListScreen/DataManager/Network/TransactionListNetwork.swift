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
        
        Alamofire.request(self.url).responseObject { (response: DataResponse<TransactionAmountData>) in
            
            guard let successResponse = response.result.value,
                let responseArray = successResponse.data else {
                
                onComplete(.error)
                return
            }
            
            onComplete(.success(responseArray))
        }
    }
    
    lazy var url: String = {
        
        guard let budAPIURL = Bundle.main.object(forInfoDictionaryKey: "BudAPIURL") as? String else {
            
            fatalError("Bud API URL Not found in info.plist")
        }
        
        return budAPIURL
    }()
}
