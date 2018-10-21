//
//  TransactionListModel.swift
//  budTestApp
//
//  Created by martin ogg on 18/10/2018.
//  Copyright © 2018 martin ogg. All rights reserved.
//

import Foundation
import ObjectMapper

enum TransactionListNetworkResponse {
    case error
    case success([TransactionListNetworkElement])
}

class TransactionAmountData: Mappable {
    var data: [TransactionListNetworkElement]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        data <- map["data"]
    }
}

class TransactionListNetworkElement: Mappable {
    
    var id: String?
    var date: String?
    var description: String?
    var category_id: Int?
    var currency: String?
    var amount: TransactionAmount?
    var product: TransactionProduct?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        date <- map["date"]
        description <- map["description"]
        category_id <- map["category_id"]
        currency <- map["currency"]
        amount <- map["amount"]
        product <- map["product"]
    }
}

class TransactionAmount: Mappable {
    
    var value: Float?
    var currency_iso: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        value <- map["value"]
        currency_iso <- map["currency_iso"]
    }
}

class TransactionProduct: Mappable {
    
    var id: Int?
    var title: String?
    var icon: String?

    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        icon <- map["icon"]
    }
}
