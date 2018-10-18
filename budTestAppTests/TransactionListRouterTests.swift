//
//  TransactionListRouterTests.swift
//  budTestAppTests
//
//  Created by martin ogg on 18/10/2018.
//  Copyright © 2018 martin ogg. All rights reserved.
//

import XCTest
@testable import budTestApp

class TransactionListRouterTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func testAttachTransactionListModule() {
        let mockVC = TransactionListViewController()
        
        TransactionListRouter.attachTransactionListModule(to: mockVC)
        
        XCTAssert(mockVC.viewModel != nil)
        XCTAssert(mockVC.viewModel?.viewController != nil)
        XCTAssert(mockVC.viewModel?.router != nil)
        XCTAssert(mockVC.viewModel?.network != nil)
    }

}
