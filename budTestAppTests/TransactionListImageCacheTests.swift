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
        
        //let testBundle = Bundle(for: type(of: self))
        //let imageUrl = testBundle.path(forResource: "testImage", ofType: "png")!
        let imageUrl = "https://storage.googleapis.com/budcraftstorage/uploads/products/lloyds-bank/Llyods_Favicon-1_161201_091641.jpg"
        //TODO: Currently this is using online image request, but it fails when it has a url path to json test file locally.
        
        self.sut = TransactionListImageCache(imageCache: mockImageCache)
        
        self.sut.image(urlString: imageUrl, onSucceed: { (image) in
            
            imageSucceedExpectation.fulfill()
        })
        
        waitForExpectations(timeout: 5, handler: nil)
    }
}
