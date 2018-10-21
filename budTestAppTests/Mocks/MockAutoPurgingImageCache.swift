//
//  MockAutoPurgingImageCache.swift
//  budTestAppTests
//
//  Created by martin ogg on 21/10/2018.
//  Copyright © 2018 martin ogg. All rights reserved.
//

import Foundation
import AlamofireImage

class MockAutoPurgingImageCache: AutoPurgingImageCache {
 
    var imageFuncCallback: (()->())?
    var addFuncCallback: (()->())?
    
    override func image(withIdentifier identifier: String) -> Image? {
        
        imageFuncCallback?()
        return super.image(withIdentifier: identifier)
    }
    
    override func add(_ image: Image, withIdentifier identifier: String) {
        
        addFuncCallback?()
        super.add(image, withIdentifier: identifier)
    }
}
