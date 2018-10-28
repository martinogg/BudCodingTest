//
//  TransactionListPresenterTests.swift
//  budTestAppTests
//
//  Created by martin ogg on 28/10/2018.
//  Copyright © 2018 martin ogg. All rights reserved.
//

import XCTest
@testable import budTestApp

class TransactionListPresenterTests: XCTestCase {

    var sut: TransactionListPresenter!
    
    override func setUp() {
        
        self.sut = TransactionListPresenter()
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
        
        let mockInteractor = MockTransactionListInteractor()
        mockInteractor.requestTransactionListToRespond = .error
        
        mockInteractor.requestTransactionListCallback = {
            
            requestTransactionListExpectation.fulfill()
        }
        
        self.sut.viewController = mockViewController
        self.sut.interactor = mockInteractor
        
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
