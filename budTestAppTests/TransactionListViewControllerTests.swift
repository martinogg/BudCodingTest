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
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TransactionListViewController") as! TransactionListViewController
        self.sut = vc
        _ = self.sut.view // To call viewDidLoad
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testViewDidLoad() {
        
        self.sut.viewDidLoad()
        
        XCTAssert(self.sut.presenter != nil)
        // Note: The Module attach function is a static! Can't mock, but measure the results of calling the attach function.
        // If the storyboard wasn't used, the Router could be injected on init and mock it here
    }
    
    func testRefreshButtonPressed() {
        
        let refreshButtonPressedExpectation = expectation(description: "refreshButtonPressedExpectation")
        let mockPresenter = MockTransactionListPresenter()
        mockPresenter.refreshButtonPressedCallBack = {
            
            refreshButtonPressedExpectation.fulfill()
        }
        self.sut.presenter = mockPresenter
        
        self.sut.refreshButton.sendActions(for: .touchUpInside)
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testShowLoadingScreen() {
        
        let presentFuncCallbackExpectation = expectation(description: "presentFuncCallbackExpectation")
        let showLoadingScreenCallbackExpectation = expectation(description: "showLoadingScreenCallbackExpectation")
        let sut = OverrideTransationListViewController()
        
        sut.presentFuncCallback = { (view, _, _) in
            
            presentFuncCallbackExpectation.fulfill()
            guard let alert = view as? UIAlertController else {
                
                XCTFail()
                return
            }
            XCTAssert(alert.title == NSLocalizedString("Refreshing", comment: ""))
            XCTAssert(alert.message == NSLocalizedString("Please wait", comment: ""))
        }
        
        sut.showLoadingScreen(onComplete: {
            
            showLoadingScreenCallbackExpectation.fulfill()
        })
        
        waitForExpectations(timeout: 5, handler: nil)

        return;
    }
    
    func testHideLoadingScreen() {
        
        let mockAlertController = MockUIAlertController()
        let alertDismissedCallbackExpectation = expectation(description: "alertDismissedCallbackExpectation")
        
        self.sut.refreshingAlert = mockAlertController

        self.sut.hideLoadingScreen(onComplete: {
            
            XCTAssert(mockAlertController.dismissCalled == true)
            alertDismissedCallbackExpectation.fulfill()
        })
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testShowErrorScreen() {
        
        let presentFuncCallbackExpectation = expectation(description: "presentFuncCallbackExpectation")
        let sut = OverrideTransationListViewController()
        sut.presentFuncCallback = { (view, _, _) in
            
            presentFuncCallbackExpectation.fulfill()
            guard let errorAlert = view as? UIAlertController else {
                
                XCTFail()
                return
            }
            XCTAssert(errorAlert.title == NSLocalizedString("Error", comment: ""))
            XCTAssert(errorAlert.message == NSLocalizedString("An Error Occurred", comment: ""))
        }
        
        sut.showErrorMessage()
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testUpdate() {
        
        let reloadDataExpectation = expectation(description: "reloadDataExpectation")
        let mockElements: [TransactionListNetworkElement] = MockJSONData.mockJSONData()!.data!
        let mockTableView = MockUITableView()
        
        mockTableView.reloadDataCallBack = { [unowned self] in
            
            reloadDataExpectation.fulfill()
            XCTAssert(self.sut.transactionList.count == 10)
        }
        self.sut.tableView = mockTableView

        self.sut.update(elements: mockElements)
        
        waitForExpectations(timeout: 5, handler: nil)
    }
}
