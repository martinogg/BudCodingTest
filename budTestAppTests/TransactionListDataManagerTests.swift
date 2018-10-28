//
//  TransactionListDataManagerTests.swift
//  budTestAppTests
//
//  Created by martin ogg on 28/10/2018.
//  Copyright © 2018 martin ogg. All rights reserved.
//

import XCTest
@testable import budTestApp

class TransactionListDataManagerTests: XCTestCase {

    var sut: TransactionListDataManager!
    
    override func setUp() {
        
        self.sut = TransactionListDataManager()
    }

    func testRequestTransactionList() {

        let requestTransactionListCallbackExpectation = expectation(description: "requestTransactionListCallbackExpectation")
        
        let mockNetwork = MockTransactionListNetwork()
        mockNetwork.requestTransactionListCallback = {
            
            requestTransactionListCallbackExpectation.fulfill()
        }
        mockNetwork.requestTransactionListToRespond = .error
        self.sut.network = mockNetwork
        self.sut.requestTransactionList(onComplete: { (response) in
            
        })
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testImageFunc() {
        
        let imageFuncCallbackCallbackExpectation = expectation(description: "imageFuncCallbackCallbackExpectation")
        let mockImageCache = MockTransactionListImageCache()
        mockImageCache.imageFuncCallback = {
            
            imageFuncCallbackCallbackExpectation.fulfill()
        }
        self.sut.imageCache = mockImageCache
        self.sut.image(urlString: "url", onSucceed: { (image) in
            
            
        })
        
        waitForExpectations(timeout: 5, handler: nil)
    }
}
