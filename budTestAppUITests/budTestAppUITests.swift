//
//  budTestAppUITests.swift
//  budTestAppUITests
//
//  Created by martin ogg on 28/10/2018.
//  Copyright © 2018 martin ogg. All rights reserved.
//

import XCTest

class budTestAppUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    func testRunThrough() {

        let app = XCUIApplication()
        
        XCTAssertEqual(app.navigationBars.count, 1)
        let navigationBar = app.navigationBars.firstMatch
        XCTAssertEqual(navigationBar.buttons.count, 1)
        
        XCTAssertEqual(app.tables.count, 1)
        
        let table = app.tables.element(boundBy: 0)
        XCTAssertEqual(table.cells.count, 0)
        XCUIApplication().navigationBars["budTestApp.TransactionListView"].buttons["Refresh"].tap()
        
        sleep(3) // wait for network request to complete
        // NOTE: This test is using the actual online endpoint. Need to mock this for UI test
        
        XCTAssert(XCUIApplication().tables.cells.containing(.staticText, identifier:"Forbidden planet").staticTexts["Lloyds Bank"].exists)
        XCTAssertEqual(table.cells.count, 10)
    }

}
