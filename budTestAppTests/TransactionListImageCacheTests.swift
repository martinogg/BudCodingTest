//
//  TransactionListImageCacheTests.swift
//  budTestAppTests
//
//  Created by martin ogg on 21/10/2018.
//  Copyright © 2018 martin ogg. All rights reserved.
//

import XCTest
@testable import budTestApp

class TransactionListImageCacheTests: XCTestCase {

    var sut: TransactionListImageCache!
    
    override func setUp() {
        
    }

    func testImage() {

        let imageCacheAddFuncExpectation = expectation(description: "imageCacheAddFuncExpectation")
        let imageCacheImageFuncCallbackExpectation = expectation(description: "imageCacheImageFuncCallbackExpectation")
        let imageSucceedExpectation = expectation(description: "imageSucceedExpectation")
        
        let mockImageCache = MockAutoPurgingImageCache()
        
        mockImageCache.addFuncCallback = {
            
            imageCacheAddFuncExpectation.fulfill()
        }
        
        mockImageCache.imageFuncCallback = {
            
            imageCacheImageFuncCallbackExpectation.fulfill()
        }
        
        let imageUrl = "file://" + Bundle(for: type(of: self)).resourcePath! + "/testImage.png"
        
        self.sut = TransactionListImageCache(imageCache: mockImageCache)
        
        self.sut.image(urlString: imageUrl, onSucceed: { (image) in
            
            imageSucceedExpectation.fulfill()
        })
        
        waitForExpectations(timeout: 5, handler: nil)
    }
}
