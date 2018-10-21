//
//  TransactionListCellTests.swift
//  budTestAppTests
//
//  Created by martin ogg on 21/10/2018.
//  Copyright © 2018 martin ogg. All rights reserved.
//

import XCTest
@testable import budTestApp

class TransactionListCellTests: XCTestCase {

    var sut: TransactionListCell!
    
    override func setUp() {
    
        self.sut = TransactionListCell()
    }

    func testConfigure() {
        
        let element = MockJSONData.mockJSONData()!.data!.first!
        let mockName1 = UILabel()
        let mockName2 = UILabel()
        let mockPrice = UILabel()
        let mockImage = UIImageView()
        
        self.sut.name1 = mockName1
        self.sut.name2 = mockName2
        self.sut.price = mockPrice
        self.sut.icon = mockImage
            
        self.sut.configure(with: element)
        
        XCTAssert(self.sut.icon != nil)
        XCTAssert(mockName1.text == element.description)
        XCTAssert(mockName2.text == element.product!.title!)
        XCTAssert(mockPrice.text == "\(element.amount!.value!) \(element.currency!)")
    }
}
