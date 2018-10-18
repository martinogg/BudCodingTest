//
//  TransactionListModel.swift
//  budTestApp
//
//  Created by martin ogg on 18/10/2018.
//  Copyright © 2018 martin ogg. All rights reserved.
//

import Foundation

enum TransactionListNetworkResponse {
    case error
    case success([TransactionListNetworkElement])
}

struct TransactionListNetworkElement {
    
    var name: String // TODO Match this up to JSON api
}
