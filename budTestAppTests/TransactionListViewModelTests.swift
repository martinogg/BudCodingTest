//
//  TransactionListViewModelTests.swift
//  budTestAppTests
//
//  Created by martin ogg on 20/10/2018.
//  Copyright © 2018 martin ogg. All rights reserved.
//

import XCTest
@testable import budTestApp

class TransactionListViewModelTests: XCTestCase {

    var sut: TransactionListViewModel!
    
    override func setUp() {
    
        self.sut = TransactionListViewModel()
    }

    func testRefreshButtonPressed() {
        
        let showLoadingScreenExpection = expectation(description: "showLoadingScreenExpection")
        let hideLoadingScreenCallbackExpection = expectation(description: "hideLoadingScreenCallbackExpection")
        let requestTransactionListExpectation = expectation(description: "requestTransactionListExpectation")
        
        let mockViewController = MockTransactionListViewController()
        mockViewController.showLoadingScreenCallback = {
            
            showLoadingScreenExpection.fulfill()
        }
        
        mockViewController.hideLoadingScreenCallback = {
            
            hideLoadingScreenCallbackExpection.fulfill()
        }
        
        let mockNetwork = MockTransactionListNetwork()
        mockNetwork.requestTransactionListToRespond = .error
        
        mockNetwork.requestTransactionListCallback = {
            
            requestTransactionListExpectation.fulfill()
        }
        
        self.sut.viewController = mockViewController
        self.sut.network = mockNetwork
        
        self.sut.refreshButtonPressed()
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testHandleRequestResponseSuccess() {
        
        let updateCallbackExpectation = expectation(description: "updateCallbackExpectation")
        let mockViewController = MockTransactionListViewController()
        let mockResponseElements: [TransactionListNetworkElement] = MockJSONData.mockJSONData()!.data!
        let mockResponse: TransactionListNetworkResponse = .success(mockResponseElements)
        
        mockViewController.showErrorMessageCallback = {
            
            XCTFail()
        }
        
        mockViewController.updateCallback = { response in
            
            updateCallbackExpectation.fulfill()
            XCTAssert(response.count == mockResponseElements.count)
        }
        
        self.sut.viewController = mockViewController
        
        self.sut.handleRequestResponse(response: mockResponse)
        
        waitForExpectations(timeout: 5, handler: nil)
        
    }
    
    func testHandleRequestResponseFail() {
        
        let showErrorMessageCallbackExpectation = expectation(description: "showErrorMessageCallbackExpectation")
        let mockViewController = MockTransactionListViewController()
        mockViewController.showErrorMessageCallback = {
            
            showErrorMessageCallbackExpectation.fulfill()
        }
        
        mockViewController.updateCallback = { _ in
            
            XCTFail()
        }
        
        self.sut.viewController = mockViewController
        
        let mockResponse: TransactionListNetworkResponse = .error
        self.sut.handleRequestResponse(response: mockResponse)
        
        waitForExpectations(timeout: 5, handler: nil)
    }
}
