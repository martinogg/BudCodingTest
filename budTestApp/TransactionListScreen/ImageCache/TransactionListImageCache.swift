//
//  TransactionListImageCache.swift
//  budTestApp
//
//  Created by martin ogg on 18/10/2018.
//  Copyright © 2018 martin ogg. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage

class TransactionListImageCache: TransactionListImageCacheProtocol {
    
    let imageCache = AutoPurgingImageCache()
    
    func image(urlString: String, onSucceed: @escaping (UIImage)->()) {
        //TODO TEST
        
        if let cachedImage = self.imageCache.image(withIdentifier: urlString) {
            
            onSucceed(cachedImage)
            return
        }
        
        Alamofire.request(urlString).responseImage { [unowned self] response in
            
            if let image = response.result.value {
                
                self.imageCache.add(image, withIdentifier: urlString)
                onSucceed(image)
            }
        }
    }
}
