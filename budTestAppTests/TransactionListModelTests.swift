//
//  TransactionListModelTests.swift
//  budTestAppTests
//
//  Created by martin ogg on 21/10/2018.
//  Copyright © 2018 martin ogg. All rights reserved.
//

import XCTest
import ObjectMapper
@testable import budTestApp

class TransactionListModelTests: XCTestCase {

    func testModel() {
        
        let transactionData = MockJSONData.mockJSONData()
        guard let elements = transactionData?.data,
            let singleElement = elements.first,
            let elementAmount = singleElement.amount,
            let elementProduct = singleElement.product else {
            
            XCTFail()
            return
        }
        
        XCTAssert(elements.count == 10)
        
        XCTAssert(singleElement.id == "13acb877dc4d8030c5dacbde33d3496a2ae3asdc000db4c793bda9c3228baca1a28")
        XCTAssert(singleElement.date == "2018-03-19")
        XCTAssert(singleElement.description == "Forbidden planet")
        XCTAssert(singleElement.category_id == 0)
        XCTAssert(singleElement.currency == "GBP")
        
        XCTAssert(elementAmount.currency_iso == "GBP")
        XCTAssert(elementAmount.value == 13.0)
        
        XCTAssert(elementProduct.icon == "https://storage.googleapis.com/budcraftstorage/uploads/products/lloyds-bank/Llyods_Favicon-1_161201_091641.jpg")
        XCTAssert(elementProduct.id == 4279)
        XCTAssert(elementProduct.title == "Lloyds Bank")
    }

}
