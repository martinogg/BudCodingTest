//
//  MockTransactionListImageCache.swift
//  budTestAppTests
//
//  Created by martin ogg on 28/10/2018.
//  Copyright © 2018 martin ogg. All rights reserved.
//

import UIKit
@testable import budTestApp

class MockTransactionListImageCache: TransactionListImageCacheProtocol {

    var imageFuncCallback:(()->())?
    
    func image(urlString: String, onSucceed: @escaping (UIImage) -> ()) {
        
        self.imageFuncCallback?()
    }
}
