//
//  TransactionListInteractorTests.swift
//  budTestAppTests
//
//  Created by martin ogg on 28/10/2018.
//  Copyright © 2018 martin ogg. All rights reserved.
//

import XCTest
@testable import budTestApp

class TransactionListInteractorTests: XCTestCase {

    var sut: TransactionListInteractor!
    
    override func setUp() {
        
        self.sut = TransactionListInteractor()
    }

    func testRequestTransactionList() {
        
        let expect = expectation(description: "testRequestTransactionListExpectation")
        let mockDataManager = MockTransactionListDataManager()
        self.sut.dataManager = mockDataManager
        mockDataManager.requestTransactionListCallback = {
            
            expect.fulfill()
        }
        
        self.sut.requestTransactionList(onComplete: { (response) in
            
        })
        
        waitForExpectations(timeout: 5, handler: nil)
    }
}
