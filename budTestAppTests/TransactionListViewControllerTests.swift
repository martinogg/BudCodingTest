//
//  TransactionListViewControllerTests.swift
//  budTestAppTests
//
//  Created by martin ogg on 18/10/2018.
//  Copyright © 2018 martin ogg. All rights reserved.
//

import XCTest
@testable import budTestApp

class TransactionListViewControllerTests: XCTestCase {

    var sut: TransactionListViewController!
    
    override func setUp() {
        
        self.sut = TransactionListViewController()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testViewDidLoad() {
        
        self.sut.viewDidLoad()
        
        XCTAssert(self.sut.viewModel != nil)
        // Note: The Module attach function is a static! Can't mock, but measure the results of calling the attach function.
        // If the storyboard wasn't used, the Router could be injected on init and mock it here
    }
    
    func testRefreshButtonPressed() {
        
        let refreshButtonPressedExpectation = expectation(description: "refreshButtonPressedExpectation")
        let mockViewModel = MockTransactionListViewModel()
        mockViewModel.refreshButtonPressedCallBack = {
            
            refreshButtonPressedExpectation.fulfill()
        }
        self.sut.viewModel = mockViewModel
        
        self.sut.refreshButtonPressed()
        
        waitForExpectations(timeout: 5, handler: nil)
    }
}
