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

    func testAttachTransactionListModule() {
        let mockVC = TransactionListViewController()
        
        TransactionListRouter.attachTransactionListModule(to: mockVC)
        
        XCTAssert(mockVC.presenter != nil)
        XCTAssert(mockVC.presenter?.viewController != nil)
        XCTAssert(mockVC.presenter?.router != nil)
        XCTAssert(mockVC.presenter?.interactor != nil)
        XCTAssert(mockVC.presenter?.interactor?.presenter != nil)
        XCTAssert(mockVC.presenter?.interactor?.dataManager != nil)
        XCTAssert(mockVC.presenter?.interactor?.dataManager?.imageCache != nil)
        XCTAssert(mockVC.presenter?.interactor?.dataManager?.network != nil)
    }

}
