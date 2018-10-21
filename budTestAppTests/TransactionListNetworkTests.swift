//
//  TransactionListNetworkTests.swift
//  budTestAppTests
//
//  Created by martin ogg on 21/10/2018.
//  Copyright © 2018 martin ogg. All rights reserved.
//

import XCTest
@testable import budTestApp

class TransactionListNetworkTests: XCTestCase {

    var sut: TransactionListNetwork!
    
    override func setUp() {
        
        self.sut = TransactionListNetwork()
    }

    func testBudURL() {
        
        XCTAssert(self.sut.url == "https://www.mocky.io/v2/5b33bdb43200008f0ad1e256")
    }
    
    func testBrokenURLRequest() {
        
        let requestTransactionListOnCompleteExpectation = expectation(description: "requestTransactionListOnCompleteExpectation")
        self.sut.url = "aBrokenLink"
        
        self.sut.requestTransactionList(onComplete: { (response) in
            
            
            requestTransactionListOnCompleteExpectation.fulfill()
            
            switch response {
            case .error:
                
                break
            case .success( _ ):
                
                XCTFail()
            }
        })
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testWorkingURLRequest() {
        
        let requestTransactionListOnCompleteExpectation = expectation(description: "requestTransactionListOnCompleteExpectation")
        
        //let testBundle = Bundle(for: type(of: self))
        //self.sut.url = testBundle.path(forResource: "testModel", ofType: "json")!
        //TODO: Currently this is using online api call, but it fails when it has a url path to json test file locally. 
        
        self.sut.requestTransactionList(onComplete: { (response) in
            
            requestTransactionListOnCompleteExpectation.fulfill()
            
            switch response {
            case .error:
                
                XCTFail()
                break
            case .success( let response ):
                
                XCTAssert(response.count == 10)
            }
        })
        
        waitForExpectations(timeout: 5, handler: nil)
    }
}
